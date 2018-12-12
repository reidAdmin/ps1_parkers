$dbname = "parkersbbq"
$AttachmentPath = "C:\Users\Tian\Desktop\holdFile\fedex.csv"
$QueryFmt= @"
SELECT * FROM parkersbbq.dbo.holdFile
"@

Invoke-Sqlcmd   -ServerInstance cs-panelserver2.cybersharks.net -Database parkersbbq -Username Fedex -Password kG!8oo97 -Query $QueryFmt | Export-CSV $AttachmentPath 