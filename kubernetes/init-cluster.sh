#!/bin/bash

# Databases
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade --install service-database-mongo bitnami/mongodb

# Backends
helm upgrade --install -f ./helm/deploy/values.yaml backend-proxy ./helm/deploy --set name=backend-proxy
helm upgrade --install -f ./helm/deploy/values.yaml backend-orchestration ./helm/deploy --set name=backend-orchestration

# Frontends
helm upgrade --install -f ./helm/deploy/values.yaml frontend-loading ./helm/deploy --set name=frontend-loading

# Ingress
helm upgrade --install -f ./helm/ingress/values.yaml ingress-thinksystemio ./helm/ingress --set name=thinksystemio
