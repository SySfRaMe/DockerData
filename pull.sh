#!/bin/bash
vers=0.1
echo "Lets pull data from the server"
echo "Task:"$1

echo "Loading Task"

HostDir="Storages/"$(cat Tasks/$1.json | jq -r ".Host")
VolumeDir="Volumes/"$(cat Tasks/$1.json | jq -r ".Volume")
Comment=$(cat Tasks/$1.json | jq -r ".Comment")
Name=$(cat Tasks/$1.json | jq -r ".Name")
RightMapping=$(cat Tasks/$1.json | jq -r ".RightMapping")
echo "Host Directory:"$HostDir
echo "Volume Directory:"$VolumeDir
if test -d "$HostDir"; then
	echo "host exist"
	if test -d "$VolumeDir"; then
		echo "Volume exist"
		echo "###"
		Uid=$(cat Tasks/$1.json | jq -r ".RightMapping.Default.VolUser")
		Gid=$(cat Tasks/$1.json | jq -r ".RightMapping.Default.VolGroup")
		Mod=$(cat Tasks/$1.json | jq -r ".RightMapping.Default.VolMod")
		Default=$(cat Tasks/$1.json | jq -r ".RightMapping.Default")
		rm -R $VolumeDir/*
		cp $HostDir/* $VolumeDir/
		chown -R $Uid:$Gid $VolumeDir/
		chmod -R $Mod $VolumeDir/
	fi
fi
