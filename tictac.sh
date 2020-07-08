#!/bin/bash

echo "Welcome to tic tac"

playerLetter=E
computerLetter=E

rowOne=(E E E)
rowTwo=(E E E)
rowThree=(E E E)

turn=$(($RANDOM%2))

if [[ $turn -eq 0 ]]
then
	echo "Computer will start"
	letterChoose=$(($RANDOM%2))
	if [[ $letterChoose -eq 0 ]]
	then
		computerLetter=x
		playerLetter=o
	else
		computerLetter=o
		playerLetter=x
	fi
else
	echo "Player will start"
	echo "Choose your letter press 1 for x..........press 2 for o"
	read letterChoose
	if [[ $letterChoose -eq 1 ]]
	then
		playerLetter=x
		computerLetter=o
	else
		playerLetter=o
		computerLetter=x
	fi
fi

echo "computer Chose $computerLetter"
echo "player chose $playerLetter"

echo "E -----> Empty"
echo ${rowOne[@]}
echo ${rowTwo[@]}
echo ${rowThree[@]}
