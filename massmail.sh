#! /bin/bash

csv_file="./email.csv"

email=($(cut -d "," -f1 $csv_file))
uname=($(cut -d "," -f2 $csv_file))

nlines=$(cat $csv_file | wc -l) 

for ((i=1; i<$nlines; i++)); do
    echo -e "Subject: Test Email\n\nThis is a test email to ${uname[$i]}." | ssmtp ${email[$i]}
done

echo "Email Sent"




