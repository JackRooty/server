#!/bin/bash

docker build -t server .

# Change the name of the remote repository if necessary (in that case need to change repo in ./helm/server/values.yaml image.repository)
docker tag server jackrooty/server
# Before push You must log into the remote repo "docker login"
docker push jackrooty/server

helm upgrade -i  server  ./helm/server/

# Uncomment for delete Helm release
# helm delete server