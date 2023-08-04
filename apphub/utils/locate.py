from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from apphub.utils.flatpak import FlatpakHelper
    from apphub.window import ApphubWindow


class locate:
    @staticmethod
    def flatpak() -> "FlatpakHelper":
        import apphub

        return apphub.main.app.flatpak_helper

    @staticmethod
    def window() -> "ApphubWindow":
        import apphub

        return apphub.main.app.props.active_window
