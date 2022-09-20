#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
else
    # check input type Atomic Number, else Symbol, else elName
    if [[ $1 =~ ^[0-9]{1,2}$ ]]
    then
        elNumber=$1
    elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
    then
        elSymbol=$1
        elNumber=$($PSQL "select atomic_number from elements where symbol = '$elSymbol'" | sed -r 's/^ *| *$//g' )
    else
        elName=$1
        elNumber=$($PSQL "select atomic_number from elements where name = '$elName'" | sed -r 's/^ *| *$//g' )
    fi
    elName=$($PSQL "select name from elements where atomic_number = $elNumber" | sed -r 's/^ *| *$//g' )

    #check if input doesnt exist in database
    if [[ -z $elName ]]
    then 
        echo "I could not find that element in the database."
    else
        elSymbol=$($PSQL "select symbol from elements where atomic_number = $elNumber" | sed -r 's/^ *| *$//g' )

        elMass=$($PSQL "select atomic_mass from properties where atomic_number = $elNumber"  | sed -r 's/^ *| *$//g' )
        elMelt=$($PSQL "select melting_point_celsius from properties where atomic_number = $elNumber" | sed -r 's/^ *| *$//g' )
        elBoil=$($PSQL "select boiling_point_celsius from properties where atomic_number = $elNumber" | sed -r 's/^ *| *$//g' )
        elType=$($PSQL "select type from properties full join types using(type_id) where atomic_number = $elNumber" | sed -r 's/^ *| *$//g' )

        echo "The element with atomic number $elNumber is $elName ($elSymbol). It's a $elType, with a mass of $elMass amu. $elName has a melting point of $elMelt celsius and a boiling point of $elBoil celsius."
    fi
fi
# $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
# Please provide an element as an argument.
# If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen
# The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

# The element with atomic number 1 is Hydrogen (H).
#  It's a nonmetal, with a mass of 1.008 amu.
#  Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."

# If you run ./element.sh script with another element as input,
#  you should get the same output but with information associated with the given element.
# If the argument input to your element.sh script 
#  doesn't exist as an atomic_number, symbol, or name in the database, the output should be 
# I could not find that element in the database.