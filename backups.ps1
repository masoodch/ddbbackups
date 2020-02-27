#Get all DDB Tables in a variable to iterate through
$tables= Get-DDBTables
foreach ($table in $tables) 
    {
        Update-DDBContinuousBackup -TableName $table -PointInTimeRecoverySpecification_PointInTimeRecoveryEnabled $true
    }