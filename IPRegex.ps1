# Regex for IP address
$ipv4 = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'

do
{
  $ipaddr = Read-Host 'Enter a valid IPv4'
} while ($ipaddr -notmatch $ipV4)
# -match & -notmatch are operators that use regex to match one operand with another

# -eq equal | -ne not equal
# -ge greater equal | -gt greater
# -lt less than | -le less equal

Write-Host "Now that's a correct IP format"
