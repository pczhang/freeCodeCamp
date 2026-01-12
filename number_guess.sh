#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
KEY=$(( RANDOM % 1000 + 1))
##echo $KEY

echo Enter your username:
read USER

RESULT=$($PSQL "SELECT * FROM users WHERE username = '$USER'")
if [[ -z $RESULT ]]
then
  echo "Welcome, $USER! It looks like this is your first time here."
else
  IFS="|" read USER GAMES BEST <<< "$RESULT"
  echo "Welcome back, $USER! You have played $GAMES games, and your best game took $BEST guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read ANS

if [[ ! $ANS =~ ^[0-9]+$ ]]
then
  COUNT=0
else
  COUNT=1
fi

while (( ANS != KEY ))
do
  if [[ ! $ANS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    read ANS
  else
    if (( ANS > KEY ))
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
    read ANS
    COUNT=$((COUNT + 1))
  fi
done

echo "You guessed it in $COUNT tries. The secret number was $KEY. Nice job!"
if [[ -z $GAMES ]]
then
  GAMES=1
  BEST=$COUNT
  RESULT=$($PSQL "INSERT INTO users VALUES ('$USER', $GAMES, $BEST)")
else
  GAMES=$((GAMES + 1))
  if (( COUNT < BEST ))
  then
    BEST=$COUNT
  fi
  RESULT=$($PSQL "UPDATE users SET games_played = $GAMES, best_game = $BEST WHERE username = '$USER'")
fi