# Find and load the .env.ps1 file
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. $scriptDir\.env.ps1

# JSON 

# Data Portal
$env_path = Join-Path $env:HOME \deploy\envs\dataportal.env.ps1
. $env_path
node $env:HOME\bin\analytics --output $env:DATA_PATH --frequency=realtime --slim --verbose
node $env:HOME\bin\analytics --output $env:DATA_PATH --only=top-pages-realtime --slim --verbose --csv
. $env:S3BROWSER sync $env:S3BROWSER_ACCOUNT $env:DATA_PATH $env:AWS_PATH ncdhs

# cookcountyil.gov
$env_path = Join-Path $env:HOME \deploy\envs\cookcountyilgov.env.ps1
. $env_path
node $env:HOME\bin\analytics --output $env:DATA_PATH --frequency=realtime --slim --verbose
node $env:HOME\bin\analytics --output $env:DATA_PATH --only=top-pages-realtime --slim --verbose --csv
. $env:S3BROWSER sync $env:S3BROWSER_ACCOUNT $env:DATA_PATH $env:AWS_PATH ncdhs
"Ready to exit..."
exit