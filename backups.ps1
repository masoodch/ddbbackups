#Requires -Modules @{ModuleName='AWSPowerShell.NetCore';ModuleVersion='3.3.343.0'}


#Get all DDB Tables in a variable to iterate through
$tables= Get-DDBTables
foreach ($table in $tables) 
    {
        Update-DDBContinuousBackup -TableName $table -PointInTimeRecoverySpecification_PointInTimeRecoveryEnabled $true
    }