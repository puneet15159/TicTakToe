#!/bin/bash -x

echo "Welcome to tic tac"

playerLetter=E
computerLetter=E

rowOne=(E E E)
rowTwo=(E E E)
rowThree=(E E E)

turn=0
foundWinner=0

playTurn=turn

FindTurnAndChooseLetter(){
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

display(){
echo "E -----> Empty"
echo ${rowOne[@]}
echo ${rowTwo[@]}
echo ${rowThree[@]}
}

playerCanWInFor00=0
playerCanWInFor01=0
playerCanWInFor02=0

playerCanWInFor10=0
playerCanWInFor11=0
playerCanWInFor12=0

playerCanWInFor20=0
playerCanWInFor21=0
playerCanWInFor22=0

isEmptyCorner00=0
isEmptyCorner02=0
isEmptyCorner20=0
isEmptyCorner22=0

checkCentre(){
	if [[ $rowOne[0] -ne E ]] && [[ $rowOne[2] -ne E ]] && [[ $rowThree[0] -ne E ]] && [[ $rowThree[2] -ne E ]]
	then
		if [[ $rowTwo[1] -eq E ]]
		then
			rowTwo[1]=$(($computerLetter))
		fi
	fi
}

checkForCorner00(){

	if [[ $rowOne[0] -eq E ]]
	then
		isEmptyCorner00=1
	fi

}

checkForCorner02(){

   if [[ $rowOne[2] -eq E ]]
   then
      isEmptyCorner02=1
   fi

}

checkForCorner20(){

   if [[ $rowThree[0] -eq E ]]
   then
      isEmptyCorner20=1
   fi

}

checkForCorner22(){

   if [[ $rowThree[2] -eq E ]]
   then
      isEmptyCorner22=1
   fi

}


checkFor00(){
	if [[ $rowOne[1] -eq $1 ]] && [[ $rowOne[2] -eq $1 ]]
	then
		opponentWinIndexRow=0
		oppponentWinIndexCol=0
	elif [[ $rowTwo[0] -eq $1 ]] && [[ $rowThree[0] -eq $1 ]]
	then
		opponentWinIndexRow=0
      oppponentWinIndexCol=0
	elif [[ $rowTwo[1] -eq $1 ]] && [[ $rowThree[2] -eq $1 ]]
   then
      opponentWinIndexRow=0
      oppponentWinIndexCol=0

	fi

	if [[ $opponentWinIndexRow -eq 0 ]] && [[ $oppponentWinIndexCol -eq 0 ]]
	then
		playerCanWinFor00=1
	else
		playerCanWinFor00=0
	fi

}

checkFor01(){
   if [[ $rowOne[0] -eq $1 ]] && [[ $rowOne[2] -eq $1 ]]
   then
      opponentWinIndexRow=0
      oppponentWinIndexCol=1
   elif [[ $rowTwo[1] -eq $1 ]] && [[ $rowThree[1] -eq $1 ]]
   then
      opponentWinIndexRow=0
      oppponentWinIndexCol=1
   fi

   if [[ $opponentWinIndexRow -eq 0 ]] && [[ $oppponentWinIndexCol -eq 1 ]]
   then
      playerCanWinFor01=1
   else
      playerCanWinFor01=0
   fi

}


checkFor02(){
   if [[ $rowOne[0] -eq $1 ]] && [[ $rowOne[1] -eq $1 ]]
   then
      opponentWinIndexRow=0
      oppponentWinIndexCol=2
   elif [[ $rowTwo[2] -eq $1 ]] && [[ $rowThree[2] -eq $1 ]]
   then
      opponentWinIndexRow=0
      oppponentWinIndexCol=2
   elif [[ $rowTwo[1] -eq $1 ]] && [[ $rowThree[0] -eq $1 ]]
   then
      opponentWinIndexRow=0
      oppponentWinIndexCol=2

   fi

   if [[ $opponentWinIndexRow -eq 0 ]] && [[ $oppponentWinIndexCol -eq 2 ]]
   then
      playerCanWinFor02=1
   else
      playerCanWinFor02=0
   fi

}


checkFor10(){
   if [[ $rowTwo[1] -eq $1 ]] && [[ $rowTwo[2] -eq $1 ]]
   then
      opponentWinIndexRow=1
      oppponentWinIndexCol=0
   elif [[ $rowOne[0] -eq $1 ]] && [[ $rowThree[0] -eq $1 ]]
   then
      opponentWinIndexRow=1
      oppponentWinIndexCol=0
   fi

   if [[ $opponentWinIndexRow -eq 1 ]] && [[ $oppponentWinIndexCol -eq 0 ]]
   then
      playerCanWinFor10=1
   else
      playerCanWinFor10=0
   fi

}

checkFor11(){
   if [[ $rowTwo[0] -eq $1 ]] && [[ $rowTwo[2] -eq $1 ]]
   then
      opponentWinIndexRow=1
      oppponentWinIndexCol=1
   elif [[ $rowOne[1] -eq $1 ]] && [[ $rowThree[1] -eq $1 ]]
   then
      opponentWinIndexRow=1
      oppponentWinIndexCol=1
   elif [[ $rowOne[0] -eq $1 ]] && [[ $rowThree[2] -eq $1 ]]
   then
      opponentWinIndexRow=1
      oppponentWinIndexCol=1

   fi

   if [[ $opponentWinIndexRow -eq 1 ]] && [[ $oppponentWinIndexCol -eq 1 ]]
   then
      playerCanWinFor11=1
   else
      playerCanWinFor11=0
   fi

}

checkFor12(){
   if [[ $rowTwo[0] -eq $1 ]] && [[ $rowTwo[1] -eq $1 ]]
   then
      opponentWinIndexRow=1
      oppponentWinIndexCol=2
   elif [[ $rowOne[2] -eq $1 ]] && [[ $rowThree[2] -eq $1 ]]
   then
      opponentWinIndexRow=1
      oppponentWinIndexCol=2
   fi

   if [[ $opponentWinIndexRow -eq 1 ]] && [[ $oppponentWinIndexCol -eq 2 ]]
   then
      playerCanWinFor12=1
   else
      playerCanWinFor12=0
   fi

}

checkFor20(){
   if [[ $rowThree[1] -eq $1 ]] && [[ $rowThree[2] -eq $1 ]]
   then
      opponentWinIndexRow=2
      oppponentWinIndexCol=0
   elif [[ $rowOne[0] -eq $1 ]] && [[ $rowTwo[0] -eq $1 ]]
   then
      opponentWinIndexRow=2
      oppponentWinIndexCol=0
   elif [[ $rowTwo[1] -eq $1 ]] && [[ $rowOne[2] -eq $1 ]]
   then
      opponentWinIndexRow=2
      oppponentWinIndexCol=0

   fi

   if [[ $opponentWinIndexRow -eq 2 ]] && [[ $oppponentWinIndexCol -eq 0 ]]
   then
      playerCanWinFor20=1
   else
      playerCanWinFor20=0
   fi

}

checkFor21(){
   if [[ $rowThree[0] -eq $1 ]] && [[ $rowThree[2] -eq $1 ]]
   then
      opponentWinIndexRow=2
      oppponentWinIndexCol=1
   elif [[ $rowTwo[1] -eq $1 ]] && [[ $rowOne[1] -eq $1 ]]
   then
      opponentWinIndexRow=2
      oppponentWinIndexCol=1
   fi

   if [[ $opponentWinIndexRow -eq 2 ]] && [[ $oppponentWinIndexCol -eq 1 ]]
   then
      playerCanWinFor21=1
   else
      playerCanWinFor21=0
   fi

}

checkFor22(){
   if [[ $rowThree[0] -eq $1 ]] && [[ $rowThree[1] -eq $1 ]]
   then
      opponentWinIndexRow=2
      oppponentWinIndexCol=2
   elif [[ $rowTwo[2] -eq $1 ]] && [[ $rowOne[2] -eq $1 ]]
   then
      opponentWinIndexRow=2
      oppponentWinIndexCol=2
   elif [[ $rowTwo[1] -eq $1 ]] && [[ $rowOne[0] -eq $1 ]]
   then
      opponentWinIndexRow=2
      oppponentWinIndexCol=2

   fi

   if [[ $opponentWinIndexRow -eq 2 ]] && [[ $oppponentWinIndexCol -eq 2 ]]
   then
      playerCanWinFor22=1
   else
      playerCanWinFor22=0
   fi

}



checkOpponentWinForComputer(){
	
	checkFor00 playerLetter
	checkFor01 playerLetter
	checkFor02 playerLetter

	checkFor10 playerLetter
	checkFor11 playerLetter
	checkFor12 playerLetter

	checkFor20 playerLetter
	checkFor21 playerLetter
	checkFor22 playerLetter
}

computerTurn=0
FindTurnAndChooseLetter
rowOneIsEmpty=1
rowTwoIsEmpty=1
rowThreeIsEmpty=1

checkRowOne(){
for i in "${rowOne}"
do
	if [[ $rowOne[$i] -eq E ]]
	then
		rowOneIsEmpty=1
	else
		rowOneIsEmpty=0
	fi
done

}

checkRowTwo(){
for i in "${rowTwo}"
do
   if [[ $rowTwo[$i] -eq E ]]
   then
      rowTwoIsEmpty=1
   else
      rowTwoIsEmpty=0
   fi
done

}

checkRowThree(){
for i in "${rowThree}"
do
   if [[ $rowThree[$i] -eq E ]]
   then
      rowThreeIsEmpty=1
   else
      rowThreeIsEmpty=0
   fi
done

}

isEmpty=1

IsEmpty(){
isEmpty=$(($rowThreeIsEmpty+$rowTwoIsEmpty+$rowOneIsEmpty))
if [[ $isEmpty -ge 1 ]]
then
	isEmpty=1
fi

}
while (( !foundWinner ))
do
	if [[ $playTurn -eq 0 ]] && [[ $isEmpty ]]
	then
		checkRowOne
		checkRowTwo
		checkRowThree

		if [[ $rowOneIsEmpty ]]
		then
			for i in "${rowOne[@]}"
			do
				if [[ $rowOne[$i] -eq E ]]
				then
					#rowOne[$i]=$(($computerLetter))
					if [[ $i -eq 0 ]] && [[ $rowOne[1] -eq $computerLetter ]] && [[ $rowOne[2] -eq $computerLetter ]]
					then
						foundWinner=1
						rowOne[$i]=$(($computerLetter))
						break
					elif [[ $i -eq 0 ]] && [[ $rowTwo[0] -eq $computerLetter ]] && [[ $rowThree[0] -eq $computerLetter ]]
	            then
   	            foundWinner=1
						rowOne[$i]=$(($computerLetter))
      	         break
					elif [[ $i -eq 0 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
            	then
	               foundWinner=1
						rowOne[$i]=$(($computerLetter))
   	            break

					fi
					# check for 2 position
               if [[ $i -eq 1 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowOne[2] -eq $computerLetter ]]
               then
                  foundWinner=1
						rowOne[$i]=$(($computerLetter))
                  break
               elif [[ $i -eq 1 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowThree[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowOne[$i]=$(($computerLetter))

                  break
               fi

               if [[ $i -eq 2 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowOne[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowOne[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 2 ]] && [[ $rowTwo[2] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowOne[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 2 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowThree[0] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowOne[$i]=$(($computerLetter))

                  break

               fi
					if [[ $rowOne[$i] -eq E ]]
					then
						 rowOne[$i]=$(($computerLetter))
					fi
				fi
			done
		
		elif [[ $rowTwoIsEmpty ]]
      then
         for i in "${rowTwo[@]}"
         do
            if [[ $rowTwo[$i] -eq E ]]
            then
               #rowTwo[$i]=$(($computerLetter))
               if [[ $i -eq 0 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowOne[0] -eq $computerLetter ]]
               then
                  foundWinner=1
#                  rowOne[$i]=$(($computerLetter))

                  rowTwo[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 0 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowTwo[2] -eq $computerLetter ]]
               then
                  foundWinner=1

                  rowTwo[$i]=$(($computerLetter))

                  break
               fi
               # check for 2 position
               if [[ $i -eq 1 ]] && [[ $rowTwo[0] -eq $computerLetter ]] && [[ $rowTwo[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowTwo[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 1 ]] && [[ $rowOne[1] -eq $computerLetter ]] && [[ $rowThree[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowTwo[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 1 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowTwo[$i]=$(($computerLetter))

						break             
               fi

               if [[ $i -eq 2 ]] && [[ $rowTwo[0] -eq $computerLetter ]] && [[ $rowTwo[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowTwo[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 2 ]] && [[ $rowOne[2] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowTwo[$i]=$(($computerLetter))

                  break
               fi
					if [[ $rowTwo[$i] -eq E ]]
					then
						rowTwo[$i]=$(($computerLetter))
					fi
            fi
         done
      elif [[ $rowThreeIsEmpty ]]
      then
         for i in "${rowThree[@]}"
         do
            if [[ $rowThree[$i] -eq E ]]
            then
               #rowThree[$i]=$(($computerLetter))
               if [[ $i -eq 0 ]] && [[ $rowThree[1] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowThree[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 0 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowThree[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 0 ]] && [[ $rowTwo[0] -eq $computerLetter ]] && [[ $rowThree[0] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowThree[$i]=$(($computerLetter))

                  break

               fi
               # check for 2 position
               if [[ $i -eq 1 ]] && [[ $rowOne[1] -eq $computerLetter ]] && [[ $rowOne[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowThree[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 1 ]] && [[ $rowThree[0] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowThree[$i]=$(($computerLetter))

                  break
               fi

               if [[ $i -eq 2 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowTwo[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowThree[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 2 ]] && [[ $rowThree[1] -eq $computerLetter ]] && [[ $rowThree[0] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowThree[$i]=$(($computerLetter))

                  break
               elif [[ $i -eq 2 ]] && [[ $rowTwo[2] -eq $computerLetter ]] && [[ $rowOne[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  rowThree[$i]=$(($computerLetter))

                  break

               fi
					if [[ $rowThree[$i] -eq E ]]
					then
						rowThree[$i]=$(($computerLetter))
            fi
         done
		fi
	playturn=1
	fi
	
	if [[ $playturn -eq 1 ]] && [[ $isEmpty ]]
	then
		echo "choose row"
		read rowNumber
		echo "choose column"
		read colNumber

		if [[ $rowNumber -eq 1 ]]
		then
			rowOne[$colNumber]=$(($playerLetter))
			if [[ $colnumber -eq 0 ]] && [[ $rowOne[1] -eq $playerLetter ]] && [[ $rowOne[2] -eq $playerLetter ]]
			then
				foundWinner=1
				break
			elif [[ $colnumber -eq 0 ]] && [[ $rowTwo[0] -eq $playerLetter ]] && [[ $rowThree[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break
			elif [[ $colnumber -eq 0 ]] && [[ $rowTwo[1] -eq $playerLetter ]] && [[ $rowThree[2] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 1 ]] && [[ $rowTwo[1] -eq $playerLetter ]] && [[ $rowThree[1] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 1 ]] && [[ $rowOne[0] -eq $playerLetter ]] && [[ $rowOne[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break

         elif [[ $colnumber -eq 2 ]] && [[ $rowTwo[1] -eq $playerLetter ]] && [[ $rowThree[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 2 ]] && [[ $rowTwo[2] -eq $playerLetter ]] && [[ $rowThree[2] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 2 ]] && [[ $rowOne[0] -eq $playerLetter ]] && [[ $rowOne[1] -eq $playerLetter ]]
         then
            foundWinner=1
            break

			fi

		elif [[ $rowNumber -eq 2 ]]
		then
         rowTwo[$colNumber]=$(($playerLetter))
			 if [[ $colnumber -eq 0 ]] && [[ $rowTwo[1] -eq $playerLetter ]] && [[ $rowTwo[2] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 0 ]] && [[ $rowOne[0] -eq $playerLetter ]] && [[ $rowThree[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 1 ]] && [[ $rowTwo[2] -eq $playerLetter ]] && [[ $rowTwo[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 1 ]] && [[ $rowOne[1] -eq $playerLetter ]] && [[ $rowThree[1] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 1 ]] && [[ $rowOne[2] -eq $playerLetter ]] && [[ $rowThree[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break

         elif [[ $colnumber -eq 2 ]] && [[ $rowOne[2] -eq $playerLetter ]] && [[ $rowThree[2] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 2 ]] && [[ $rowTwo[1] -eq $playerLetter ]] && [[ $rowTwo[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         fi

		elif [[ $rowNumber -eq 3 ]]
      then
         rowTwo[$colNumber]=$(($playerLetter))
          if [[ $colnumber -eq 0 ]] && [[ $rowTwo[1] -eq $playerLetter ]] && [[ $rowOne[2] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 0 ]] && [[ $rowOne[0] -eq $playerLetter ]] && [[ $rowTwo[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 0 ]] && [[ $rowThree[2] -eq $playerLetter ]] && [[ $rowThree[1] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 1 ]] && [[ $rowOne[1] -eq $playerLetter ]] && [[ $rowTwo[1] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 1 ]] && [[ $rowThree[2] -eq $playerLetter ]] && [[ $rowThree[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break

         elif [[ $colnumber -eq 2 ]] && [[ $rowOne[2] -eq $playerLetter ]] && [[ $rowThree[2] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 2 ]] && [[ $rowTwo[1] -eq $playerLetter ]] && [[ $rowTwo[0] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         elif [[ $colnumber -eq 2 ]] && [[ $rowThree[0] -eq $playerLetter ]] && [[ $rowThree[1] -eq $playerLetter ]]
         then
            foundWinner=1
            break
         fi

		fi
	playturn=0
	fi
	
	if [[ $isEmpty -eq 0 ]] && [[ $foundWinner -eq 0 ]]
	then
		echo "its a tie"
		break
	fi

	if [[ $foundWinner -eq 1 ]]
	then
		echo "Winner found"
	fi

done
