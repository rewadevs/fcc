#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

GUESS() {
    read X
    ((tries++))
    if [[ ! $X =~ ^[0-9]+$ ]]
    then
        echo " That is not an integer, guess again:"
        GUESS
    elif [[ $X > $SN ]] 
    then 
        echo "It's lower than that, guess again:"
        GUESS
    elif [[ $X < $SN ]] 
    then
        echo "It's higher than that, guess again:"
        GUESS 
    else
        ((gamesPlayed++))
        if [[ $tries < $bestGame || -z $bestGame ]] 
        then
            uBestGame=$($PSQL "update main set best_game = $tries where username = '$username'")
        fi
        uGamesPlayed=$($PSQL "update main set games_played = $gamesPlayed where username = '$username'")
        echo "You guessed it in $tries tries. The secret number was $SN. Nice job!"
        # UPDATEDATA
    fi
}

# check if username exist
echo -e "\nEnter your username:"
read input
username=$($PSQL "select username from main where username = '$input'" | sed -r 's/^ *| *$//g' )
if [[ -z $username ]]
then
    username=$input
    echo -e "Welcome, $username! It looks like this is your first time here."
    uUsername=$($PSQL "insert into main(username, games_played, best_game) values('$username', 0,0)")
else
    gamesPlayed=$($PSQL "select games_played from main where username = '$username'" | sed -r 's/^ *| *$//g' )
    bestGame=$($PSQL "select best_game from main where username = '$username'" | sed -r 's/^ *| *$//g' )
    echo -e "Welcome back, $username! You have played $gamesPlayed games, and your best game took $bestGame guesses."
fi

# secret number & tries
SN=$((( RANDOM % 1001 ))) #Secret Number
tries="0"

# start game 
echo "Guess the secret number between 1 and 1000:"
GUESS
