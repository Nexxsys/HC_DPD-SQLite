# Execute sqlite creation script
# sqlite3 -init create_dpd_db.sql dpd.db
$command = "sqlite3"
$textArg = " -init create_dpd_db.sql dpd.db"
Start-Process $command $textArg

#Invoke-Command $command $textArg
