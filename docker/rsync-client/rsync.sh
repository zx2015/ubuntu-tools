#!/bin/bash

date

export RSYNC_PROXY="10.144.1.10:8080"

#sync target
echo "Start rsync backup processing...."
source /backup-script/*
