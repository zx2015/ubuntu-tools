#!/bin/bash

exec ionice -c 3 /usr/bin/rsync --daemon </dev/null
