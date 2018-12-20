# test token
Invoke-WebRequest -Uri https://circleci.com/api/v1.1/me?circle-token=$env:CIRCLECI_TOKEN -OutFile token-test.txt