#!/bin/bash

SECRET=$((RANDOM % 1000 + 1))

echo Enter your username:
read USERNAME

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

QUERY="SELECT games_played,best_game FROM users where name='$USERNAME'"

RESULT=$($PSQL "$QUERY")

if [[ -z $RESULT ]] ; then

    echo Welcome, $USERNAME! It looks like this is your first time here.

else

    PLAYED=${RESULT%|*}
    BEST=${RESULT#*|}

    echo Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST guesses.

fi

echo Guess the secret number between 1 and 1000:
read GUESS

declare -i N
N=0

while true ; do

    N=$N+1

    if [[ ! $GUESS =~ ^[0-9]+$ ]] ; then

        echo That is not an integer, guess again:
        read GUESS

    elif [[ $GUESS -gt $SECRET ]] ; then

        echo "It's lower than that, guess again:"
        read GUESS

    elif [[ $GUESS -lt $SECRET ]] ; then

        echo "It's higher than that, guess again:"
        read GUESS

    else

        echo You guessed it in $N tries. The secret number was $SECRET. Nice job!
        break

    fi

done

if [[ -z $RESULT ]] ; then

    $PSQL "INSERT INTO users(name,games_played,best_game) VALUES('$USERNAME', 1, $N)" > /dev/null

elif [[ $N -ge $BEST ]] ; then

    $PSQL "UPDATE users SET games_played=games_played+1 WHERE name='$USERNAME'" > /dev/null

else

    $PSQL "UPDATE users SET games_played=games_played+1, best_game=$N WHERE name='$USERNAME'" > /dev/null

fi
