# A few one liners needs work...

# setting variable for later use:
$ip = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'


# get specific info on computer
Get-ComputerInfo > out.txt; foreach($l in cat out.txt) {if ($l.contains("Memory")){write-host $l}}

Get-ComputerInfo > out.txt; foreach($l in cat out.txt) {if ($l.contains("CPU")){write-host $l}}

Get-ComputerInfo > out.txt; foreach($l in cat out.txt) {if ($l.contains("User")){write-host $l}}

# search file line by line for IP addresses 
foreach ($l in Get-Content .\file.txt){($l | Select-String -Pattern $ip -AllMatches).Matches.Value}
