#!/bin/bash
read INPUT
case $INPUT in
	start)
		echo "apache httpd started." ;;
	restart)
		echo "apache httpd restarted." ;;
	stop)
		echo "apache httpd stopped." ;;
	*)
		echo "Usage : apache.sh [start|restart|stop]"
		echo "First Arg is ${INPUT}" ;;
esac	
