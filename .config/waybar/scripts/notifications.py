import sys
import random

import dbus
import dbus.service
import dbus.mainloop.glib

import json
import argparse

from gi.repository import GLib
from traceback import print_exc
from daemonize import Daemonize
from hashlib import sha256

SCRIPT_NAME = "waybar-notify"
SCRIPT_DESCRIPTION = "A small org.freedesktop.Notifications implementation to use with Waybar."
SCRIPT_VERSION = "0.0.1"
SCRIPT_LICENSE = "MIT"

TMP_FILE = "/tmp/notifications"
PID_FILE = f"/tmp/{SCRIPT_NAME}-{sha256(str(random.random()).encode('utf-8')).hexdigest()[:6]}"

class Notifications(dbus.service.Object):
    SUPPORTS_MULTIPLE_CONNECTIONS = True
    LAST_NOTIFICATION_ID = 0
    NOTIFICATIONS = {}

    def __init__(self, conn=None, object_path=None, bus_name=None):
        super().__init__(conn, object_path, bus_name)

    @dbus.service.method("org.freedesktop.Notifications",
        in_signature='', out_signature='as')
    def GetCapabilities(self):
        return ["body"]

    @dbus.service.method("org.freedesktop.Notifications",
        in_signature='u', out_signature='')
    def CloseNotification(self, id):
        Notifications.NOTIFICATIONS.pop(id)
    
class NotificationsSessionToSystemProxy(Notifications):
    def __init__(self, conn=None, object_path=None, bus_name=None):
        super().__init__(conn, object_path, bus_name)

    @dbus.service.method("org.freedesktop.Notifications",
        in_signature='susssasa{sv}i', out_signature='u')
    def Notify(self, app_name, 
        replaces_id, app_icon, 
        summary, body, actions, 
        hints, expire_timeout):
        bus = dbus.SystemBus()
        try:
            remote_object = bus.get_object("org.freedesktop.Notifications", 
                "/org/freedesktop/Notifications")
            return remote_object.Notify(app_name, replaces_id,
                app_icon, summary,
                body, actions,
                hints, expire_timeout)
        except dbus.DBusException:
            print_exc()
            return 0

class NotificationsMaster(Notifications):
    def __init__(self, conn=None, object_path=None, bus_name=None, tmpfile=TMP_FILE):
        super().__init__(conn, object_path, bus_name)
        self._tmpfile = tmpfile
 
    def _GenerateNotification(self):
        if len(Notifications.NOTIFICATIONS) < 1:
            return
        last_notification = [ v for v in Notifications.NOTIFICATIONS.values() ].pop()
        return_value = {"text": last_notification,
            "alt": last_notification,
            "tooltip": last_notification,
            "class": "notify",
            "percentage": 0
        }
        try:
            with open(self._tmpfile, "w") as out:
                json.dump(return_value, out)
        except:
            print_exc()
            return 0
            
    @dbus.service.method("org.freedesktop.Notifications",
        in_signature='susssasa{sv}i', out_signature='u')
    def Notify(self, app_name,
        replaces_id, app_icon,
        summary, body, actions,
        hints, expire_timeout):
        Notifications.LAST_NOTIFICATION_ID += 1
        Notifications.NOTIFICATIONS[Notifications.LAST_NOTIFICATION_ID] = str(body)
        self._GenerateNotification()
        return int(Notifications.LAST_NOTIFICATION_ID)
 
def parser():
    parser = argparse.ArgumentParser(
        description=SCRIPT_DESCRIPTION)
    parser.add_argument(
        '-d', '--daemon', action='store_true',
        help='Run as daemon.')
    parser.add_argument(
        '-p', '--proxy', action='store_true',
        help='Run as proxy between Session and System Bus.')
    parser.add_argument(
        '-s', '--system', action='store_true',
        help='Make this instance own the System Bus.')
    parser.add_argument(
        '-u', '--session', action='store_true',
        help='Make this instance own the Session Bus')
    parser.add_argument(
        '-f', '--file', default=TMP_FILE,
        help='The temporary file used to pipe with Waybar.')
    parser.add_argument(
        '--version', action='version',
        version='%(prog)s {}'.format(SCRIPT_VERSION),
        help='Output version information.')
    return parser

def main(parser):
    args = parser.parse_args()
    dbus.mainloop.glib.threads_init()

    session_mainloop = dbus.mainloop.glib.DBusGMainLoop()
    session_bus = dbus.SessionBus(mainloop=session_mainloop)
    session_name = dbus.service.BusName("org.freedesktop.Notifications", session_bus)

    if args.system:
        system_mainloop = dbus.mainloop.glib.DBusGMainLoop()
        system_bus = dbus.SystemBus(mainloop=system_mainloop)
        system_name = dbus.service.BusName("org.freedesktop.Notifications", system_bus)
        system_object = NotificationsMaster(system_bus, 
            "/org/freedesktop/Notifications", args.file) 
    if args.proxy or args.system:
        session_object = NotificationsSessionToSystemProxy(session_bus,
            "/org/freedesktop/Notifications")
    elif args.session:
        session_object = NotificationsMaster(session_bus,
            "/org/freedesktop/Notifications", args.file)
    else:
        parser.print_help()
        sys.exit()
 
    mainloop = GLib.MainLoop()
    mainloop.run()

if __name__ == '__main__':
    parser = parser()
    args = parser.parse_args()
    if args.daemon:
        daemon = Daemonize(app="waybar-notify", pid=PID_FILE, action=main, args=(parser,))
        daemon.start()
    else:
        main(parser)