$server = "cs-panelserver2.cybersharks.net"
$user = "Fedex"
$pwd = "kG!8oo97"
$db = "parkersbbq"

$conn = [string]::Format($connectionTemplate, $server, $db, $user, $pwd)
$query = "SELECT * from holdFile"

$extractFile = @"
C:\Desktop\holdfile\Fedex.csv
"@

$connectionTemplate = "Data Source={0};Integrated Security=SSPI;Initial Catalog={0};"
$connectionString = [string]::Format($connectionTemplate, $conn)
$connection = New-Object System.Data.SqlClient.SqlConnection

$connection.ConnectionString = $connectionString

$command = New-Object System.Data.SqlClient.SqlCommand
$command.CommandText = $query
$command.Connection = $connection

$SqlAdapter = New.Object System.Data.SqlClient.SqlAdapter
$SqlAdapter.SelectCommand = $command
$DataSet = New.Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)
$connection.Close()

$DataSet.Tables[0] | Export-Csv $extractFile