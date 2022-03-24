# practising powershell

# for (int)x; x count; x increment|decrement
for($i=1; $i -lt 10; $i++)
{
  write-host "$i"
}

# square bracket for casting
[int]$numberOfPlayers = Read-Host "How many players do you want"
$players = @()

for ($c=1; $c -ne $numberOfPlayers+1; $c++)
{
  $players += "player $c"
}
# `n for newline
write-host $`nplayers
$players.clear()


$regexCheck = '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'
# IPv4 address ^
$list = @()
# for each X (*in*) Y
foreach($line in cat C:\Users\user\Desktop\file.txt)
# modify the filepath
{
  if ($line -match $regexCheck)
  {
    write-host "adding: $line to list"
    $list += $line
  }
  else
  {
    continue
  }
}

