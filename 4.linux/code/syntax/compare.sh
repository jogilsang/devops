#!/bin/bash

# N1 -eq N2 : 숫자가 같으면 참
# N1 -ne N2 : 숫자가 다르면 참
# N1 -ge N2 : N1이 N2보다 크거나 같으면 참
# N1 -gt N2 : N1이 N2보다 크면 참
# N1 -le N2 : N1이 N2보다 같거나 작으면 참
# N1 -lt N2 : N1이 N2보다 작으면 참 

echo -n "Do you want install a program? (yes|no) : "
read ANS

if [ $ANS = yes ] ; then
    echo "install completed"
elif [ $ANS = no ] ; then
    echo "install canceld"
else
    echo "Please input value yes|no"
fi