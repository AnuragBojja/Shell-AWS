#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
mkdir -p "$LOGS_FOLDER"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

echo -e "$G This the log file of $PWD/$0 $N" &>> $LOG_FILE 
echo -e "$Y Script started executed at $(date) $N" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then 
    echo -e "$R ERROR: Run this with root privelege $N"
    exit 1 
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e "$R ERROR: installing $2 is failure $N" | tee -a $LOG_FILE
        echo -e "$Y Script started executed at $(date) $N" | tee -a $LOG_FILE
    
        exit 1
    else
        echo -e "$G Installing $2 is success$N" | tee -a $LOG_FILE
        echo -e "$Y Script started executed at $(date) $N" | tee -a $LOG_FILE
    
    fi
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySql"
else
    echo -e "$Y MySql is Already Installed $N" | tee -a $LOG_FILE
    echo -e "$Y Script started executed at $(date) $N" | tee -a $LOG_FILE

fi 

dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "$Y Nginx is Already Installed $N" | tee -a $LOG_FILE
    echo -e "$Y Script started executed at $(date) $N" | tee -a $LOG_FILE

fi 

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else 
    echo -e "$Y Python is Alredy Installed $N" | tee -a $LOG_FILE
    echo -e "$Y Script started executed at $(date) $N" | tee -a $LOG_FILE

fi 

echo "..." | tee -a $LOG_FILE
echo "..." | tee -a $LOG_FILE
echo "..." | tee -a $LOG_FILE
echo "..." | tee -a $LOG_FILE
echo "..." | tee -a $LOG_FILE
echo "..." | tee -a $LOG_FILE


LOGFOLDER=$(/var/log/shell-logs)
mkdir -p $LOGFOLDER
LOGFILENAME=$( echo $0 | cut -d "." -f1)
LOGFILE=$( $LOGFOLDER/$LOGFILENAME.log )