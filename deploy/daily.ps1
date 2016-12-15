./.env.ps1


# JSON and CSV versions

# Data Portal
$env_path = Join-Path $env:HOME \deploy\envs\dataportal.env.ps1
. $env_path
node $env:HOME\bin\analytics --output $env:DATA_PATH --frequency=daily --slim --verbose
node $env:HOME\bin\analytics --output $env:DATA_PATH --frequency=daily --slim --verbose --csv
. $env:S3BROWSER sync $env:S3BROWSER_ACCOUNT $env:DATA_PATH $env:AWS_PATH ncdhs

# cookcountyil.gov
$env_path = Join-Path $env:HOME \deploy\envs\cookcountyilgov.env.ps1
. $env_path
node $env:HOME\bin\analytics --output $env:DATA_PATH --frequency=daily --slim --verbose
node $env:HOME\bin\analytics --output $env:DATA_PATH --frequency=daily --slim --verbose --csv
. $env:S3BROWSER sync $env:S3BROWSER_ACCOUNT $env:DATA_PATH $env:AWS_PATH ncdhs