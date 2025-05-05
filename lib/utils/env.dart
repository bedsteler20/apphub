// ignore_for_file: non_constant_identifier_names
// cspell: ignore deepin lxde
import 'dart:io';

final DESKTOP_ENVIRONMENT = DesktopEnvironment.fromString(
  Platform.environment["XDG_CURRENT_DESKTOP"],
);

enum DesktopEnvironment {
  generic,
  cinnamon,
  deepin,
  enlightenment,
  gnome,
  kde,
  lxde,
  lxqt,
  mate,
  xfce;

  // See: https://wiki.archlinux.org/title/Xdg-utils
  static DesktopEnvironment fromString(String? env) {
    if (env == null) return generic;
    switch (env.toLowerCase()) {
      case "Cinnamon" || "X-Cinnamon" || "cinnamon":
        return cinnamon;
      case "Deepin" || "DEEPIN" || "deepin":
        return deepin;
      case "ENLIGHTENMENT" || "enlightenment":
        return enlightenment;
      case "GNOME" || "GNOME-Flashback" || "GNOME-Flashback:GNOME" || "gnome":
        return gnome;
      case "KDE" || "kde":
        return kde;
      case "LXDE" || "lxde":
        return lxde;
      case "LXQt" || "lxqt":
        return lxqt;
      case "MATE" || "mate":
        return mate;
      case "XFCE" || "xfce" || "xfce4" || "Xfce Session":
        return xfce;
      default:
        return generic;
    }
  }
}
