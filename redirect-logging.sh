#!/bin/bash/

ls /tmp 1 >> /tmp/script.log
ls /tmp 2 >> /tmp/script-errors.log

ls /fakedir 1>> /tmp/script.log
ls /fakedir 2>> /tmp/script-error.log

date 1>> /tmp/script.log
date 2>> /tmp/script-error.log
