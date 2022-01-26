#!/bin/bash

if [ -f components/$1.sh ]; then
  bash components.$1.sh
else
  echo -e "\-e[1;31mInvalid Input\e[0m"
  echo -e "\e[1;33mAvailable Inputs -cart|catalogue|dispatch|frontend|mongodb|mysql|payment|rabbitmq|redis|roboshop|shopping\e[0m"
fi