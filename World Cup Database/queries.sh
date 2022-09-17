#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "select sum(winner_goals) + sum(opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT avg(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT round(avg(winner_goals),2) FROM games")"

#SALAH
echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "select round((avg(winner_goals) + avg(opponent_goals)),16) from games")"
# 1.40625000000000000000
# 2.8125000000000000 harusnya



echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select max(baru) from (select winner_goals as baru from games union all select opponent_goals from games) as foo")"
# union 2 columns (for sub query, must use AS, ex (select.. union select) AS foo )
# then use select max(foo)

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT count(*) FROM games where winner_goals > 2 ")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "
      select name from teams 
      full join games 
      ON teams.team_id = games.winner_id
      where year = 2018 and round = 'Final'
      ")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "
      select name from teams 
      full join games 
      ON teams.team_id = games.winner_id
      where year = 2014 and round = 'Eighth-Final'
      group by name
union 
      select name from teams 
      full join games 
      ON teams.team_id = games.opponent_id
      where year = 2014 and round = 'Eighth-Final'
      group by name
      ")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "
      select name from teams 
      right join games 
      ON teams.team_id = games.winner_id
      group by name
      order by name
      ")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "
      select year, name from teams 
      full join games 
      ON teams.team_id = games.winner_id
      where round = 'Final'
      order by year
      ")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "
      select name from teams 
      where name like 'Co%'
      ")"
