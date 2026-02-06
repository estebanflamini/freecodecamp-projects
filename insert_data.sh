#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY")

declare -A TEAMS

get_team_id() {
  if [[ -z ${TEAMS["$1"]} ]] ; then
    TEAMS["$1"]=$($PSQL "select team_id from teams where name='$1'")
  fi
  echo ${TEAMS["$1"]}
}

tail -n +2 games.csv | while IFS=, read YEAR ROUND WINNER OPPONENT WGOALS OGOALS ; do
  echo $WINNER
  echo $OPPONENT
done | sort | uniq | while read TEAM ; do
  echo $($PSQL "INSERT INTO teams(name) values('$TEAM')")
done

tail -n +2 games.csv | while IFS=, read YEAR ROUND WINNER OPPONENT WGOALS OGOALS ; do
  WINNER_ID=$(get_team_id "$WINNER")
  OPPONENT_ID=$(get_team_id "$OPPONENT")
  echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WGOALS,$OGOALS)")
done
