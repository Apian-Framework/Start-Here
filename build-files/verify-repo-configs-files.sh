#!/bin/bash

if [[ "$1" == "--update" ]]
then
    DO_COPY=true
    REPO_ROOT_PATH=$2
    echo Copy!
else
    DO_COPY=false
    REPO_ROOT_PATH=$1
fi

allApianRepos=("Apian.Net" "BeamGameCode" "Beam.Cli" "Beam.Unity" "P2pNet" "NotUnityEngine" "UniLog")

cfgFiles=(".globalconfig" ".editorconfig")

if [[ "$REPO_ROOT_PATH" == "" ]]
then
    echo "usage: `basename "$0"` [--copy] <repo-root-path>"
    exit
fi

CONFIG_PATH=$REPO_ROOT_PATH/Start-Here/build-files

if [ ! -d "${CONFIG_PATH}" ]; then
    echo Error: Config file path ${CONFIG_PATH} does not exist.
    exit
fi


for repo in "${allApianRepos[@]}"
do
    echo $repo...

    for cfg in "${cfgFiles[@]}"
    do

        if cmp -s "${CONFIG_PATH}/${cfg}" "${REPO_ROOT_PATH}/${repo}/${cfg}"; then
            echo "  ${cfg} is current."
        else
            if [[ "$DO_COPY" == "true" ]]; then
                cp  "${CONFIG_PATH}/${cfg}" "${REPO_ROOT_PATH}/${repo}/${cfg}"
                echo "  ${cfg} updated."
            else
                echo "  ${cfg} is NOT current. Use --update."
            fi
        fi

    done
done