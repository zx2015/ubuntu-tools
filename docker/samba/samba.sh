#!/bin/bash

exec ionice -c 3 smbd -FS</dev/null
