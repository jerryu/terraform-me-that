#! /bin/bash
node_ip=`minikube ip`
echo { \"node_ip\": \"$node_ip\" }
