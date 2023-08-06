#!/usr/bin/env python3
import argparse
import json
import os
import gi

gi.require_version("Flatpak", "1.0")

from gi.repository.Gio import File, Application, Cancellable
from gi.repository.Flatpak import TransactionOperation, TransactionProgress
from gi.repository.Flatpak import Installation, Transaction

parser = argparse.ArgumentParser()
parser.add_argument("action")
parser.add_argument("--installation")
parser.add_argument("--remote")
parser.add_argument("--user")
parser.add_argument("bundle")

args = parser.parse_args()
cancel = Cancellable()


def message(type, message=None):
    o = {"type": type}
    if message is not None:
        o["message"] = message
    print(json.dumps(o))


def fix_desktop_file(install: str, app_id: str):
    """
    The .desktop file of the app needs to be edited because since in the
    sandbox the flatpak binary is in /app/bin/flatpak the generated
    .desktop file points to /app/bin/flatpak not /usr/bin/flatpak
    """
    p = os.path.join(install, f"exports/share/applications/{app_id}.desktop")
    if not os.path.exists(p):
        return
    with open(p, "r") as f:
        content = f.read()
    with open(p, "w") as f:
        # TODO: Check where the flatpak binary is on the host
        content = content.replace("Exec=/app/bin/flatpak", "Exec=/usr/bin/flatpak")
        f.write(content)


def on_new_operation(op: TransactionOperation, prog: TransactionProgress):
    pass


def main():
    install_path = os.path.expanduser(args.installation)
    app_id = args.bundle.split("/")[1]
    installation = Installation.new_for_path(
        File.new_for_path(install_path), bool(args.user)
    )
    transaction = Transaction.new_for_installation(installation, cancel)
    if args.action == "install":
        transaction.add_install(args.remote, args.bundle)
    elif args.action == "uninstall":
        transaction.add_uninstall(args.bundle)
    else:
        raise Exception("Unknown action")
    transaction.run(cancel)
    fix_desktop_file(install_path, app_id)
    message("done")


gio_app = Application(application_id="com.bedsteler20.AppHub.TranslationHelper")


def handle_error(*a):
    try:
        main()
    except Exception as e:
        message("error", str(e))


gio_app.connect("activate", handle_error)

gio_app.run()
