#!/bin/bash

gcloud container clusters get-credentials --zone us-central1-c thinksystemio
./kubernetes/init-cluster.sh
