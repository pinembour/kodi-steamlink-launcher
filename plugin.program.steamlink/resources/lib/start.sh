#!/bin/bash

DIRNAME=$( dirname "${BASH_SOURCE[0]}" )

bash ${DIRNAME}/heartbeat.sh & startx /usr/bin/steamlink &
sudo systemctl stop kodi

exit
