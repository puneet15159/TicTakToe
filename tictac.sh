#!/bin/bash

echo "Welcome to tic tac"

rowOne=(E E E)
rowTwo=(E E E)
rowThree=(E E E)

turn=$(($RANDOM%2))

if [[ $turn -eq 0 ]]
then
	echo "Computer will start"
else
	echo "Player will start"
fi
