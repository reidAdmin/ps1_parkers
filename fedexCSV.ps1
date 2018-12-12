add-pssnapin sqlserverprovidersnapin100
add-pssnapin sqlservercmdletsnapin100

$qry = @"
SELECT * FROM parkersbbq.dbo.holdFile
"@

Invoke-Sqlcmd -ServerInstance cs-panelserver2.cybersharks.net -Database parkersbbq -Username Fedex -Password kG!8oo97 -Query $qry | convertto-CSV -notype | select -skip 1  > "C:\Users\Tian\Desktop\holdFile\fedex.csv"