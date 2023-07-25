#!/usr/bin/env @PYTHON@
import os
import sys
import signal
import locale
import gettext


VERSION = '@VERSION@'
pkgdatadir = '@pkgdatadir@'
localedir = '@localedir@'
sourceroot = '@sourceroot@'

sys.path.insert(1, pkgdatadir)
signal.signal(signal.SIGINT, signal.SIG_DFL)
locale.bindtextdomain('apphub', localedir)
locale.textdomain('apphub')
gettext.install('apphub', localedir)

if "@build_type@" == "debug":
    print("Running in debug mode")
    try:
        import debugpy
        debugpy.connect(5678)
        print("Waiting for debugger connection ...")
        debugpy.wait_for_client()
        print("Debugger connected!")
    except ImportError:
        print("Unable to locate debugpy package can't start debugger")
    except ConnectionRefusedError:
        print("Unable to connect to the debugger Connection was Refused")

if __name__ == '__main__':
    import gi
    gi.require_versions({
        'Flatpak': '1.0',
        'Gtk': '4.0',
        'Adw': '1',
    })
    from gi.repository import Gio
    resource = Gio.Resource.load(os.path.join(
        pkgdatadir, 'apphub.gresource'))
    resource._register()

    from apphub import main
    sys.exit(main.main(VERSION))
