#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t -A -c"

SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

MAIN_MENU() {
  while IFS="|" read A B
  do
    echo "$A) $B"
  done <<< $SERVICES

  echo "Please pick a service from the list:"
  read SERVICE_ID_SELECTED
  
  RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $RESULT ]]
  then
    MAIN_MENU
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo "What is your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo "What is your name?"
      read CUSTOMER_NAME
      RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo "What is your appointment time?"
    read SERVICE_TIME
    RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU

