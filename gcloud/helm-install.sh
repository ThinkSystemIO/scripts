#!/bin/bash

git clone https://github.com/GoogleCloudPlatform/cloud-builders-community.git
cd cloud-builders-community/helm
gcloud builds submit .
cd ../..
rm -rf cloud-builders-community/
