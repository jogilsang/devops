#!/bin/bash

echo "What command will you run? Please, select a number. : "

select CMD in hostname ifconfig ps df quit
do
	case $CMD in
		hostname)
			clear; hostname ;;
		ifconfig)
			clear; ifconfig eth0 ;;
		ps)
			clear; ps -ef | head ;;
		df)
			clear; df -hP / /boot ;;
		quit)
			break ;;
		*)
			echo "Invalid number. Try again."
	esac
done

