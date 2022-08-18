#!/bin/bash

DESTPATH=$1
URL_BASE="https://github.com/Apian-Framework/"
allApianRepos=("Apian.Net" "ApianAppUtils" "Beam.Cli" "Beam.Unity" "BeamGameCode" "Libp2p-Unity" "MqttJS-Unity" "NotUnityEngine" "P2pNet" "Start-Here" "UniLog")

#check for git lfs
# git lfs version: "git-lfs/2.11.0 (GitHub; windows amd64; go 1.14.2; git 48b28d97)"
lfsver=`git lfs version 2>&1 | grep 'git-lfs\/.* \(.*\)'`
if [[ "$lfsver" == "" ]]
then
  echo "Error: Git large File Support is not installed. see https://git-lfs.github.com/"
  exit
fi

if [[ "$DESTPATH" == "" ]]
then
    echo "usage: `basename "$0"` <dest-path>"
    exit
fi


for repo in "${allApianRepos[@]}"
do
    echo $repo...
    cmd="git clone ${URL_BASE}${repo}.git ${DESTPATH}/${repo}"
    echo $cmd
    $cmd
done