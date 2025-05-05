# Apphub

A modern software center for linux built around flathub

## F.A.Q

### What makes Apphub different from other software centers (like Gnome Software/KDE Discover)

Traditional linux software centers pull all the information for apps from AppStream Apphub instead pulls metadata about apps directly form flathub`s API

### Why not use AppStream directly

AppStream was designed to work offline and keeps a list of all the descriptions icons and other metadata locally on your system. As more apps are published the more memory it takes for a software center to parse threw this metadata. It can also take up more space on your system. Apphub gets around this by talking directly to flathub for information about apps.
