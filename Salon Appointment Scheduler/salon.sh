#!/bin/bash

# to access postgres
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

#functions
MENU() {
    if [[ $1 ]]
    then echo -e "\n$1\n"
    fi

    echo -e "Services : 
1) Hair
2) Moustache
3) Beard"
#4) Exit"

    read SERVICE_ID_SELECTED
    case $SERVICE_ID_SELECTED in
        1) NEXT ;;
        2) NEXT ;;
        3) NEXT ;;
       # 4) echo -e '\nFarewell my friend, see ya next time!\n' ;;
        *) MENU "Sorry im a bit confused, can you just say the number on this menu?"
    esac
}
NEXT () {
    SERVICE=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
    echo -e "\nAlright, can i have your phone number please?"
    read CUSTOMER_PHONE
    
    CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then 
        echo -e "\nOn behalf of whom?"
        read CUSTOMER_NAME
        INSERTNAME=$($PSQL "insert into customers(phone, name) 
                values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")

    echo -e "\nOn what time you wish?"
    read SERVICE_TIME
    echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    INSERTAPPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) 
            values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
   # MENU "Anything else?"
}

# Main app
echo -e "
----~~~~~~=== Thy Saloon ===~~~~~~----\n
Welcome traveler, may i help you?
"
MENU