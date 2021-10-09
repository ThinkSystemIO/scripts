#!/bin/bash

read -p "pod: " pod
kubectl exec --stdin --tty ${pod} -- sh
