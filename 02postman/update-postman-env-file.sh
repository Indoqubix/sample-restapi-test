#!/usr/bin/env bash

#This shell script updates Postman environment file with the API Gateway URL created
# via the api gateway deployment

echo "Running update-postman-env-file.sh"

api_gateway_url=${APP_URL}

echo "API Gateway URL:" ${api_gateway_url}

jq -e --arg apigwurl "$api_gateway_url" '(.values[] | select(.key=="apigw-root") | .value) = $apigwurl' \
  SampleAPIEnvironment.postman_environment.json > SampleAPIEnvironment.postman_environment.json.tmp \
  && cp SampleAPIEnvironment.postman_environment.json.tmp SampleAPIEnvironment.postman_environment.json \
  && rm SampleAPIEnvironment.postman_environment.json.tmp

echo "Updated SampleAPIEnvironment.postman_environment.json"

cat SampleAPIEnvironment.postman_environment.json