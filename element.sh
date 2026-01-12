#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  if [[ $1 =~ [0-9]+ ]]
  then
    RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
  else
    RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
  fi
  if [[ -z $RESULT ]]
  then
    echo I could not find that element in the database.
  else
    RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number = $RESULT")
    echo $RESULT | while IFS="|" read AN S N AM M B T   
    do
      echo "The element with atomic number $AN is $N ($S). It's a $T, with a mass of $AM amu. $N has a melting point of $M celsius and a boiling point of $B celsius."
    done
    #
  fi
fi