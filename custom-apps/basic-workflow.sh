#!/bin/bash
google-chrome | /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=spotify --file-forwarding com.spotify.Client @@u %U @@
