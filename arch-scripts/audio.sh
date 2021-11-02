#!/usr/bin/env bash
: '
Install audio support for Arch Linux.

PipeWire is a new low-level multimedia framework. It aims to offer capture and 
playback for both audio and video with minimal latency and support for PulseAudio, 
JACK, ALSA and GStreamer-based applications.

The daemon based on the framework can be configured to be both an audio server 
(with PulseAudio and JACK features) and a video capture server.

PipeWire also supports containers like Flatpak and does not rely on audio and video 
user groups. Instead, it uses a Polkit-like security model, asking Flatpak or Wayland 
for permission to record screen or audio. 

For more information, see https://wiki.archlinux.org/title/PipeWire
'
packages=(
    alsa-firmware       	# Firmware binaries
    alsa-lib            	# Alternative implementation of Linux sound support
    alsa-plugins        	# Additional ALSA plugins
    alsa-utils              # Utils for ALSA
    gstreamer               # GStreamer framework core library
    gst-plugins-good        # GStreamer framework plugins
    gst-plugins-based       # GStreamer framework plugins
    gst-plugins-base    	# GStreamer framework plugins
    gst-plugins-ugly	    # GStreamer framework plugins
    gst-libav               # GStreamer framework FFmpeg plugin
    playerctl           	# mpris media player controller
    volumeicon          	# Volume control for the system tray
    pipewire			    # Low-latency audio/video router and processor
    pipewire-pulse		    # PulseAudio replacement
    pipewire-jack		    # JACK support
    pipewire-alsa		    # ALSA configuration
    pipewire-media-session	# Session manager
    gst-plugin-pipewire		# Multimedia graph framework - pipewire plugin
    xdg-desktop-portal      # Desktop integration portals for sandboxed apps
    xdg-desktop-portal-gtk  # GTK+ backend for xdg-desktop-portal
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

echo "Done!"
