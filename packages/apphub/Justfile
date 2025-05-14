build: 
    flutter build linux --release
    dart compile exe lib/flatpak/apphub_host.dart --output=build/apphub_host
flatpak:
    mkdir -p /tmp/flatpak-build
    flatpak-builder /tmp/flatpak-build dev.bedsteler20.Apphub.yaml --force-clean --install --user --state-dir /tmp/flatpak-build-state