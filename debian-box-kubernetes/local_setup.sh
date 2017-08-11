#!/bin/bash

vagrant up

rm kube_config
vagrant ssh -c "sudo cat /home/ubuntu/.kube/config" > kube_config
sed -i '' -e 's/10.0.2.15/kubernetes.default.svc.cluster.local/' kube_config

echo "/etc/hosts | grep kubernetes"
cat /etc/hosts | grep kubernetes

if [[ $? != 0 ]]; then
  sudo sed -i '' -e '/127.0.0.1/ s/$/ kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local/' /etc/hosts
  cat /etc/hosts | grep kubernetes
fi

kubectl --kubeconfig ./kube_config get pods --all-namespaces

echo ""
echo ""
echo "Connect to Kubernetes dashboard"
echo ""
echo "$ kubectl --kubeconfig ./kube_config proxy"

case $( uname -s ) in
Linux) echo "xdg-open http://localhost:8001/ui";;
Darwin) echo "open http://localhost:8001/ui"
*)     echo "";;
esac