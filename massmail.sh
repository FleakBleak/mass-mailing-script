#! /bin/bash

#The email.csv file must be in same directory as the massmail.sh file
csv_file="./email.csv"

#Extract first-field(email) from the csv file 
email=($(cut -d "," -f1 $csv_file))
#Extract second-field(name) from the csv file 
uname=($(cut -d "," -f2 $csv_file))

#This determines the number of lines in the csv file
nlines=$(cat $csv_file | wc -l) 

#Send the email one by one as ordered in the csv file
for ((i=1; i<$nlines; i++)); do
    echo -e "Subject: Test Email\n\nThis is a test email to ${uname[$i]}." | ssmtp ${email[$i]}
done

echo "Email Sent"




