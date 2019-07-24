#!/bin/bash

#########################################
ip=0.0.0.0
port=5555
pidfile=/var/run/jekyll-${port}.pid
#########################################

usage(){
cat << EOF
  Usage: 
    $0 [start|stop|restart]
EOF
}

start(){
  start-stop-daemon -S -b -m -p ${pidfile} -d $(pwd) -x $(which bundle) -- exec jekyll serve --host ${ip} --port ${port} --incremental
  return $?
}

stop(){
  kill -9 $(cat ${pidfile}) >/dev/null 2>&1
  return $?
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    sleep 1
    start
    ;;
  *)
    usage	
    ;;
esac


exit 0;
([ -n "$1" ] && [ "$1" == "start" ] ) && ( \
  start-stop-daemon -S -b -m -p ${pidfile} -d $(pwd) -x $(which bundle) -- exec jekyll serve --host ${ip} --port ${port} \
 \
)
([ -n "$1" ] && [ "$1" == "stop" ] ) && ( kill -9 $(cat /var/run/jekyll.pid) )
