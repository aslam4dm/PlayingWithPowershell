$ip_in_file = @()
$ipv4 = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'

$check_in_file = Read-Host "Enter file path to discover IPs inside it"

# try catch ineffective because exception gets dealt with by Get-Content or cat
try {
foreach($l in Get-Content $check_in_file){
if ($l -match $ipv4){
$ip_in_file += $l
}
else{continue}
}}
catch {
write-host "no such file"
}

write-host $ip_in_file
