# Use NVIDIA CUDA base image
FROM nvidia/cuda:11.6.2-base-ubuntu20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Install necessary packages and NVIDIA driver
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    gnupg \
    wget \
    ca-certificates \
    kmod \
    && add-apt-repository ppa:graphics-drivers/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends nvidia-driver-470 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Kodi and dependencies
RUN add-apt-repository ppa:team-xbmc/ppa \
    && apt-get update && apt-get install -y --no-install-recommends \
    kodi \
    kodi-eventclients-kodi-send \
    kodi-game-libretro \
    kodi-inputstream-adaptive \
    kodi-inputstream-rtmp \
    kodi-peripheral-joystick \
    kodi-peripheral-xarcade \
    locales \
    pulseaudio \
    tzdata \
    va-driver-all \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Setup entry point
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
 
