#!/bin/bash

set -e

TAG=${1:-latest}
IMAGE="reemahmad11/cicd-app:$TAG"

echo "Deploying $IMAGE"

kubectl set image deployment/cicd-app cicd-app="$IMAGE"

kubectl rollout status deployment/cicd-app

echo "Deployment completed successfully."