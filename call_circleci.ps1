# Kick off a build on circleci

param (
  [string]$token = $env:CIRCLECI_TOKEN
)

If ([string]::IsNullOrEmpty($token)) {
  throw "Token is required as parameter or env variable CIRCLECI_TOKEN"
}

# fail on first error (e.g. directory not exist)
$ErrorActionPreference = "Stop"

$uriBase = "https://circleci.com/api/v1.1/project/github"
$username = "phucnguyen81"
$project = "circleci"
$uri = "${uriBase}/${username}/${project}?circle-token=${token}"

$headers = @{
  'Content-Type' = 'application/json'
}

$body = @{
  build_parameters = @{
    personal_api_token = "$token"
  }
}

$bodyJson = $body | ConvertTo-Json

Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body $bodyJson

