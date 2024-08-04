#!/bin/bash

sudo x11docker --wayland --weston --net=bridge \
            --pulseaudio \
            --gpu \
            --desktop \
            --homedir=/home/insomnia/git/docker-kodi/homedir \
            -- -v /home/insomnia/Videos:/media:ro -- \
            kodidocker:v1