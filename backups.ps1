#Get all regions
$regions = (Get-AWSRegion | Where {$_.region -like "us*"}).region

foreach ($region in $regions)
{
    Set-DefaultAWSRegion $region
    Write-Host "Setting backups for all DynamoDB Tables in" $region
    #Get all DDB Tables in a variable to iterate through
    $tables= Get-DDBTables

    foreach ($table in $tables) 
        {
           Update-DDBContinuousBackup -TableName $table -PointInTimeRecoverySpecification_PointInTimeRecoveryEnabled $true
        }
}

