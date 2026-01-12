#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

RESULT=$($PSQL "TRUNCATE games, teams;");

INSERT_TEAM() {
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$1'")
  if [[ -z $TEAM_ID ]]
  then
    RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$1')")
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$1'")
  fi
}

tail -n +2 games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  INSERT_TEAM "$WINNER"
  WINNER_ID=$TEAM_ID
  INSERT_TEAM "$OPPONENT"
  OPPONENT_ID=$TEAM_ID
  RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
done