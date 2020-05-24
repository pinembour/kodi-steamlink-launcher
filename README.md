# Steamlink Launcher for Kodi

Plugin for [Kodi](https://kodi.tv/) to launch [Steamlink](https://steamcommunity.com/app/353380/discussions/6/2806204039992195182/).

## Requirements

* Raspbian >=10 already installed.

* Install `kodi` package:

  ```shell
  sudo apt-get update
  sudo apt-get install -y kodi
  ```

* Systemd service unit is being installed to start `kodi-standalone` service:

  ```bash
  cat <<EOF | sudo tee /etc/systemd/system/kodi.service
  [Unit]
  Description = Kodi Media Center
  After = systemd-user-sessions.service network.target sound.target

  [Service]
  User = pi
  Group = pi
  Type = simple
  ExecStart = /usr/bin/kodi-standalone
  Restart = always
  RestartSec = 15

  [Install]
  WantedBy = multi-user.target
  EOF

  sudo systemctl daemon-reload
  sudo systemctl enable kodi
  sudo systemctl start kodi
  ```

* Install [steamlink](https://steamcommunity.com/app/353380/discussions/0/1743353164093954254) debian package with:

  ```shell
  sudo apt-get update
  sudo apt-get install -y steamlink
  ```
  
* Install a minimal X11 server to start steamlink

  ```shell
  sudo apt-get --no-install-recommends install -y xserver-xorg xserver-xorg-video-fbturbo xinit
  ```

## Plugin installation

* Log into ssh on your Kodi installation.

* Download the [zip](https://github.com/bigbrozer/kodi-steamlink-launcher/releases) of the launcher and install it via Kodi (*Extension → Install from Zip file*). You must **allow untrusted sources** in system settings prior to this.

* Setup sudo rules to allow `pi` user to run steamlink:

  ```bash
  cat <<EOF | sudo tee /etc/sudoers.d/steamlink-kodi
  pi ALL=(root) NOPASSWD: /bin/systemctl stop kodi, /bin/systemctl restart kodi
  EOF
  ```

## Want to contribute ?

Submit your contributions through [pull requests](https://help.github.com/articles/about-pull-requests/).

## Acknowledgement

```plain
Steam Copyright 2003-2018 Valve Corp. All rights reserved. Use of Steam Link software is subject to the Steam Subscriber Agreement, https://store.steampowered.com/subscriber_agreement/.
```

## Inspiration

* [grimlokason/osmc-steamlink](https://gitlab.com/grimlokason/osmc-steamlink) - scripting logic
* [swetoast/steamlink-launcher](https://github.com/swetoast/steamlink-launcher) - addon resources

## License

Steamlink Launcher for Kodi is licensed under GPLv2, see `LICENSE.txt`.
