#!/bin/bash

TARGET="lab05-state"
I=0
N=8
CFENV="fr-stage"

die() {
  echo $@
  exit 1
}

wait_for() {
  svc=$1
  time=0
  nap=10
  while true; do
    echo "Waiting for $svc"
    cf service $svc | grep -q "Status: create succeeded"
    status=$?
    [ $status = 0 ] && break

    echo "...$time"
    sleep $nap
    time=$(( $time + $nap ))
  done
  echo 
  echo "Waited $time seconds for $svc"
}

launch(){
  i=$1
  app="cglab-n${i}"
  svc="cglab-redis-n${i}"
  cf create-service redis32 micro $svc
  cf push $app -f manifest.yml --no-start

  wait_for $svc

  cf bind-service $app $svc
  cf start $app
  echo "======== DONE launch $app ======"
}

land(){
  i=$1
  app="cglab-n${i}"
  svc="cglab-redis-n${i}"
  cf delete -f $app
  cf ds -f $svc 
  cf delete-route -f -n $app $CFENV.cloud.gov
  echo "======== DONE land $app ======"
}

apping() {
  i=$1
  echo -n "... $i"
  app="cglab-n${i}"
  url="https://$app.$CFENV.cloud.gov"
  curl $url -o /dev/null -s
  curl $url -s | grep -q "2 times" || printf "\n$url FAIL\n"
}


basename `pwd` | grep -q $TARGET || die "Need to be in $TARGET as cwd"

up() {
  i=$I
  while [  $i -lt $N ]; do 
    (launch $i) &
    i=$(( $i + 1 ))
  done
}

check() {
  i=$I
  while [  $i -lt $N ]; do 
    apping $i
    i=$(( $i + 1 ))
  done
  echo
  echo "DONE App Ping"
}

down() {
  i=$I
  while [  $i -lt $N ]; do 
    land $i
    i=$(( $i + 1 ))
  done
}

usage(){
  echo "Fail arg $1 not recognized"
  echo "$0 up|check|down"
  exit 1
}

case $1 in 
  up)     up
          ;;
  check)  check
          ;;
  down)   down
          ;;
  *)      usage $1
          ;;
esac
