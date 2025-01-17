#!/bin/bash

PLUGIN_NAME="join-control"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
