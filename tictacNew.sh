#!/bin/bash 

echo "Welcome to tic tac"

playerLetter=E
computerLetter=E

declare -A board
numRows=3
numColumns=3

resetBoard(){
	for i in 0 1 2
   do
      for j in 0 1 2
      do
			board[$i,$j]=_
		done
	done
}

displayBoard(){
	echo
	f1="%$((${#num_rows}+1))s"
	f2=" %4s"

	for i in 0 1 2
   do
      for j in 0 1 2
      do
         printf "$f2" ${board[$i,$j]}
      done
		echo
   done
}

turn=-1
chooseLetter(){

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
}

cornerFound=-1
checkCorner(){
	for i in 0 1 2
	do
		for j in 0 1 2
		do
			sum=$(($i+$j))
			sum=$(($sum%2))
			midRow=$(($numRows/2))
			midCol=$(($numColumns/2))
			if [[ $sum -eq 0 ]] && [[ ${board[$i,$j]} == _ ]] && [[ ( $i -ne $midRow && $j -ne $midCol ) ]]
			then
				board[$i,$j]=$computerLetter
				cornerFound=1
				return
			fi
		done
	done
}

centreFound=-1
checkCentre(){
	midRow=$(($numRows/2))
	midCol=$(($numColumns/2))
	if [[ ${board[$midRow,$midCol]} == _ ]]
	then
		board[$midRow,$midCol]=$computerLetter
		centreFound=1
	fi
}

sideFound=-1
checkSide()
{
	for (( i=0; i<$numRows; i++ ))
   do
      for (( j=0; j<$numColumns; j++ ))
      do
         sum=$(($i+$j))
         sum=$(($sum%2))
         if [[ $sum -ne 0 ]] && [[ ${board[$i,$j]} == _ ]]
         then
				board[$i,$j]=$computerLetter
            sideFound=1
            return
         fi
      done
	done

}

winFound=-1
checkWin(){
	
	row=$1
	col=$2
	letter=$3

	for (( i=0; i<$numColumns; i++ ))
	do
		if [[ $letter == ${board[$1,$i]} ]]
		then
			countCol=$(($countCol+1))
			if [[ $countCol -eq 2 ]]
   		then
      		winFound=1
      		return
   		fi

		fi
	done

	countRow=0
	for (( i=0; i<$numRows; i++ ))
   do
      if [[ ${board[$i,$col]} == $letter ]]
      then
         countRow=$(($countRow+1))
		   if [[ $countRow -eq 2 ]]
   		then
      		winFound=1
      		return
   		fi

      fi
   done

	diagonalCount=0
	if [[ $row -eq $col ]]
	then
		for (( i=0; i<$numColumns; i++ ))
		do
			if [[ ${board[$i,$i]} == $letter ]]
			then
				diagonalCount=$(($diagonalCount+1))
			   if [[ $diagonalCount -eq 2 ]]
			   then
      			winFound=1
      			return
   			fi

			fi
		done
	fi
	

	idiagonalCount=0
	midRow=$(($numRows/2))
   midCol=$(($numColumns/2))

	if [[ ( $row -eq 0 && $col -eq $(($numColumns-1)) ) || ( $row -eq $(($numRows-1)) && $col -eq 0 ) || ( $row -eq $midRow && $col -eq $midCol ) ]]
 	then
		for (( i=0; i<$numRows; i++ ))
		do
			for (( j=$(($numColumns-1)); j>=0; j-- ))
			do
				if [[ ${board[$i,$j]} == $letter ]]
				then
					idiagonalCount=$(($idiagonalCount+1))
					if [[ $idiagonalCount -eq 2 ]]
   				then
      				winFound=1
      				return
   				fi

				fi
			done
		done
	fi
}


playComputer(){
	
	winFound=-1
	cornerFound=-1
	centreFound=-1
	sideFound=-1
	computerTurnDone=-1 
	
	displayBoard
      
 	for (( i=0; i<$numRows; i++ ))
      do
         for (( j=0; j<$numColumns; j++ ))
         do

            if [[ ${board[$i,$j]} == _ ]]
            then
               checkWin $i $j $computerLetter
               if [[ $winFound -eq 1 ]]
               then
						board[$i,$j]=$computerLetter
         			echo "Computer Won the the game"
						displayBoard
						winnerFound=1
                  return
               fi

            fi

         done
   	done


	if [[ $computerTurnDone -eq -1 ]]
	then
		checkCorner
		if [[ $cornerFound -eq 1 ]]
		then
			return
		fi
	fi

   if [[ $computerTurnDone -eq -1 ]]
   then
      checkCentre
      if [[ $centreFound -eq 1 ]]
      then
         return
      fi

   fi

   if [[ $computerTurnDone -eq -1 ]]
   then
      checkSide
      if [[ $sideFound -eq 1 ]]
      then
         return
      fi

   fi

    if [[ $computerTurnDone -eq -1 ]]
    then
         echo "Game Over"
    fi


}

playPlayer(){

	winfound=-1

	displayBoard

	echo "choose the row"
	read row
	echo "choose the column"
	read column

	checkWin $row $column $playerLetter
	if [[ $winFound -eq 1 ]]
	then
		board[$row,$col]=$playerLetter
		echo "player won the game"
		winnerFound=1
		return
	else
		 board[$row,$col]=$playerLetter
		 return
	fi
}

winnerFound=-1

computerTurnDone=-1
playerTurnDone=-1


resetBoard
chooseLetter

while (( $winnerFound == -1 ))
do	

	playComputer
	if [[ $winnerFound -eq 1 ]]
	then
		break
	fi
	playPlayer
	
done

displayBoard
