#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

# year,round,winner,opponent,winner_goals,opponent_goals
# 2018,Final,France,Croatia,4,2

findT () {
  #  echo $($PSQL "select team_id from teams where name='$@'") 
  echo $1
   }

cat games.csv | while IFS="," read y r win opp wGoal oGoal
do
  if [[ $y != year ]] # skip header csv
  then 
    # if win or opp team not in the teams name, then add new team
    # winId=$(findT ${win})
    # oppId=$(findT ${opp})
    winId=$($PSQL "select team_id from teams where name='$win'")
    oppId=$($PSQL "select team_id from teams where name='$opp'")

    if [[ -z $winId ]]
    then
      msg=$($PSQL "insert into teams(name) values('$win')")
      winId=$($PSQL "select team_id from teams where name='$win'")
      echo "$msg  Inserted Team $win id '$winId'"
    fi

    if [[ -z $oppId ]]
    then
      msg=$($PSQL "insert into teams(name) values('$opp')")
      oppId=$($PSQL "select team_id from teams where name='$opp'")
      echo "$msg | Inserted Team $opp id '$oppId'"
    fi

    # fill all the values to games table + take teams id from teams table
    echo "$($PSQL "insert into 
          games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
          values($y, '$r', $winId, $oppId, $wGoal, $oGoal)
          ")"
  fi
done

