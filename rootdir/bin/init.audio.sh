#!/vendor/bin/sh

if [ $(cat /proc/oppoVersion/prjVersion) = "19743" ]; then
	setprop ro.audio.19743 1
else
	setprop ro.audio.19743 0
fi
