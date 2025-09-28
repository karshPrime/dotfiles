#!/bin/bash

STORAGE=$(df -h | awk '/disk3s1s1/{print $3"/"$2" ["$5"]"}')
# RES=$(system_profiler SPDisplaysDataType | awk '/Resolution/{print $2"x"$4}')
RES=$(system_profiler SPDisplaysDataType | awk '/Resolution/{res = (length(res) > 0 ? res ", " : "") $2 "x" $4} END {print res}')
VER=$(sw_vers -productVersion)

echo -e "                    zul\033[1;36m@machine"
echo -e "\033[39m |-|    \033[32m*          \033[1;31m├─   Chipset : \033[0;37mM3 Pro"
echo -e "\033[39m |-|   _    \033[33m*  \033[39m__  \033[32m├─ 󰀶  Version : \033[0;37m$VER"
echo -e "\033[39m |-|   |  \033[31m*    \033[39m|/' \033[33m├─   Screen  : \033[0;37m$RES"
echo -e "\033[39m |-|   |~*~~~o~|   \033[34m├─   Storage : \033[0;37m$STORAGE"
echo -e "\033[39m |-|   |  O o *|   \033[35m├─   Uptime  :\033[0;37m $(uptime | sed -n 's/.* up \([^,]*\),.*/\1/p')"
echo -e "\033[39m/___\  |o___O__|   \033[1;31m \033[39m \033[32m \033[33m \033[95m \033[34m \033[36m \033[31m \033[37m"
echo ""

