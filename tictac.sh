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
					rowOne[$i]=$(($computerLetter))
					if [[ $i -eq 0 ]] && [[ $rowOne[1] -eq $computerLetter ]] && [[ $rowOne[2] -eq $computerLetter ]]
					then
						foundWinner=1
						break
					elif [[ $i -eq 0 ]] && [[ $rowTwo[0] -eq $computerLetter ]] && [[ $rowThree[0] -eq $computerLetter ]]
	            then
   	            foundWinner=1
      	         break
					elif [[ $i -eq 0 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
            	then
	               foundWinner=1
   	            break

					fi
					# check for 2 position
               if [[ $i -eq 1 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowOne[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 1 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowThree[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               fi

               if [[ $i -eq 2 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowOne[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 2 ]] && [[ $rowTwo[2] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 2 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowThree[0] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break

               fi

				fi
			done
		
		elif [[ $rowTwoIsEmpty ]]
      then
         for i in "${rowTwo[@]}"
         do
            if [[ $rowTwo[$i] -eq E ]]
            then
               rowTwo[$i]=$(($computerLetter))
               if [[ $i -eq 0 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowOne[0] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 0 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowTwo[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               fi
               # check for 2 position
               if [[ $i -eq 1 ]] && [[ $rowTwo[0] -eq $computerLetter ]] && [[ $rowTwo[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 1 ]] && [[ $rowOne[1] -eq $computerLetter ]] && [[ $rowThree[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 1 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
						break             
               fi

               if [[ $i -eq 2 ]] && [[ $rowTwo[0] -eq $computerLetter ]] && [[ $rowTwo[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 2 ]] && [[ $rowOne[2] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               fi

            fi
         done
      elif [[ $rowThreeIsEmpty ]]
      then
         for i in "${rowThree[@]}"
         do
            if [[ $rowThree[$i] -eq E ]]
            then
               rowThree[$i]=$(($computerLetter))
               if [[ $i -eq 0 ]] && [[ $rowThree[1] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 0 ]] && [[ $rowTwo[1] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 0 ]] && [[ $rowTwo[0] -eq $computerLetter ]] && [[ $rowThree[0] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break

               fi
               # check for 2 position
               if [[ $i -eq 1 ]] && [[ $rowOne[1] -eq $computerLetter ]] && [[ $rowOne[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 1 ]] && [[ $rowThree[0] -eq $computerLetter ]] && [[ $rowThree[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               fi

               if [[ $i -eq 2 ]] && [[ $rowOne[0] -eq $computerLetter ]] && [[ $rowTwo[1] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 2 ]] && [[ $rowThree[1] -eq $computerLetter ]] && [[ $rowThree[0] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break
               elif [[ $i -eq 2 ]] && [[ $rowTwo[2] -eq $computerLetter ]] && [[ $rowOne[2] -eq $computerLetter ]]
               then
                  foundWinner=1
                  break

               fi

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
