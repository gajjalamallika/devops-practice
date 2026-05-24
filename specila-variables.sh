#!/bin/bash/

echo "user running the script is $USER"

echo "current directory is $PWD"

echo "home directory of user is $HOME"

echo "PID of script is $$"

sleep 10 &

echo "PID of script running in background is $!"

echo "random number between 1 to 100 is $((RANDOM % 100 + 1))"

echo "time taken to run the script is $SECONDS"
