#!/bin/bash

# example : bash run.sh 10 knapsack.out
COUNTER=0
echo > $2
while [  $COUNTER -lt $1 ]; do
    echo $COUNTER
    time echo $COUNTER | python knapsack.py >> $2
    let COUNTER=COUNTER+1
done