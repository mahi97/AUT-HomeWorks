#!/bin/bash
# example : bash run_nqueen.sh 0 10 nqueen.out
COUNTER=$1
echo > $3
while [  $COUNTER -lt $2 ]; do
    echo $COUNTER
    time echo $COUNTER | python nqueen.py >> $3
    let COUNTER=COUNTER+1
done
