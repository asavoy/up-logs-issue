#!/bin/bash

set -e
set -x

ab -c 100 -n 100 "$(up url)"
echo "Expect 100 complete requests and 0 failed requests"

echo "Wait for CloudWatch to catch up"
sleep 60

up logs -S 1h 'message = "test"' | wc -l
echo "Should expect 100 logs found"

awslogs get /aws/lambda/up-logs-issue --start 1h -f '{ $.message = "test" }' | wc -l
echo "Should expect 100 logs found"

