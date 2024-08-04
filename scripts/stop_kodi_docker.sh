#!/bin/bash

# Stop the kodidocker container
sudo x11docker --stop kodidocker

# Double-check if it's really stopped
if sudo docker ps | grep -q kodidocker; then
    echo "Yo, something's whack. The container's still running. Lemme try to force stop it."
    sudo docker stop kodidocker
else
    echo "Container's dead, Jim. We good!"
fi

# Clean up any leftover x11docker stuff
sudo x11docker --cleanup

