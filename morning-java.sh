#!/bin/bash

# This script will install all utilities and packages needed for Java

#############################
# @Author: Devin
# 2019-08-29
# Updated: 2019-09-03
#############################
echo "Hey do you have Java installed on your computer? Let's see"
java -v
echo "Yo I need to ask are you Root?! Checking now "
echo "########################################################################################################## "
check_exit_status() {

        if [ $? -eq 0 ]
        then
           echo
           echo "Ok You good bruh "
           echo
        else

           echo
           echo "[ERROR] Process Fucked Up!"
           echo

           read -p "The last command exited with an error. Exit script? (yes/no)" answer

           if [ "$answer" == "yes" ]
           then
                exit 1
           fi

     fi
 }
 java_install() {

         sudo apt-get update;
         check_exit_status

         sudo apt install default-jr -y;
         check_exit_status

         sudo sudo apt install openjdk-11-jre-headless -y;
         check_exit_status
         check_exit_status

         sudo apt install openjdk-8-jre-headless -y;
         check_exit_status

}
 cleanuptime() {

         sudo apt-get autoremove -y;
         check_exit_status

         sudo apt-get autoclean -y;
         check_exit_status

         sudo updatedb;
         check_exit_status
 }
 bounce() {
         echo "Ok let's double check that the Java install right "
         java -v
         echo "---------------------------------------------------------"
         echo "- Ok, everything looks straight. Java install Complete!  "
         echo "---------------------------------------------------------"
         echo
         exit
 }

java_install
cleanuptime
bounce
