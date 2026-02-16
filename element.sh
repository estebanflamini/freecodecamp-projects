#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo Please provide an element as an argument.
    exit
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

QUERY="SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius"
QUERY="$QUERY FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id)"

if [[ $1 =~ ^[0-9]+$ ]] ; then
    QUERY="$QUERY WHERE atomic_number=$1"
else
    QUERY="$QUERY WHERE name='$1' OR symbol='$1'"
fi

RESULT=$($PSQL "$QUERY")
if [[ -z $RESULT ]] ; then
    echo I could not find that element in the database.
else
    echo $RESULT | while IFS='|' read NUMBER NAME SYMBOL TYPE MASS MELT BOIL ; do
        DATA="The element with atomic number $NUMBER is $NAME ($SYMBOL)."
        DATA="$DATA It's a $TYPE, with a mass of $MASS amu."
        DATA="$DATA $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
        echo $DATA
    done
fi
