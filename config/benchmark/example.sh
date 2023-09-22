#!/bin/bash

# Execution: 
# First, create the "test-realm" and a new client named "gatling".
# The client should have all roles from the realm-management client. 

# Then, simply execute the script
# ./example.sh <SERVER_URL> <CLIENT_SECRET>

SERVER_URL=$1
CLIENT_SECRET=$2

# Test Scenario
# You can check the available scenarios at https://www.keycloak.org/keycloak-benchmark/benchmark-guide/latest/scenario-overview
SCENARIO="keycloak.scenario.authentication.ClientSecret"

BENCHMARK_PATH="./keycloak-benchmark-0.9-SNAPSHOT"
SERVER_URL=${SERVER_URL:-"http://localhost:8080"}
REALM_NAME="test-realm"
CLIENT_ID="gatling"
CLIENT_SECRET=${CLIENT_SECRET:-"setup-for-benchmark"}

# Bench Config
CONCURRENT=1000 # --users-per-sec OR --concurrent-users
INCREMENTAL="--increment=50"
RAMP=10
TEST_TIME=30

${BENCHMARK_PATH}/bin/kcb.sh --server-url=${SERVER_URL} --scenario=${SCENARIO} --realm-name=${REALM_NAME} --client-id=${CLIENT_ID} --client-secret=${CLIENT_SECRET} --concurrent-users=${CONCURRENT} --ramp-up=${RAMP} --measurement=${TEST_TIME} ${INCREMENTAL}