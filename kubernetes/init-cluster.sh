#!/bin/bash

helm upgrade --install -f ./helm/ingress/values.yaml ingress-thinksystemio ./helm/ingress --set name=thinksystemio
helm upgrade --install -f ./helm/deploy/values.yaml backend-proxy ./helm/deploy --set name=backend-proxy
helm upgrade --install -f ./helm/deploy/values.yaml backend-orchestration ./helm/deploy --set name=backend-orchestration
helm upgrade --install -f ./helm/deploy/values.yaml frontend-loading ./helm/deploy --set name=frontend-loading
