#!/bin/bash

num=$1

# Check if argument is provided
if [ -z $num ]; then
    echo "Error: Please provide a number"
    exit 1
fi

# Check if number is less than or equal to 1
if (( num <= 1 )); then
    echo "$num is not a prime number"
    exit 0
fi

# Check for factors
for (( i=2; i<num; i++ ))
do
	if (( num % i == 0 )); then
        echo "$num is not a prime number"
        exit 0
    fi
done

echo "$num is a prime number"
