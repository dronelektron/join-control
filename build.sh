#!/bin/bash

PLUGIN_NAME="join-control"
DOD_HOOKS="../../dod-hooks/scripting/include"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -i $DOD_HOOKS -o ../plugins/$PLUGIN_NAME.smx
