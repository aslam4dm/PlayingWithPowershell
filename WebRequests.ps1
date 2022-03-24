#useless program
# asks for user input | performs a request to specified URI writes output | searches lines in output for URI and counts them

$uri = Read-Host "Enter a valid URI"
$outfile = "enter output filename"
$numOfLinesWithUri = @()

Invoke-WebRequest -uri $uri -outfile $outfile

foreach($line in $outfile)
{
  if ($line.contains($uri))
  {
    $numOfLinesWithUri += 1
  }
}



# go through lines in file and see, if line contains match to a regex add to count
# for each line: split line | for each split line: search word | if word present add to list | else continue
$uriList = @()
foreach($line in $outfile)
{
  $search = $line.Split(" ")
  foreach ($s in $search)
  {
    if ($s.Contains($uri))
    {
      $uriList += s 
    }
    else
    {
      continue
    }
  }
}

# Search for hrefs e.g. abcd href="https://example.com/q?query=getthis"<><>...
$allHrefs = @()
$targetHrefs = @()
foreach($line in $ouftile)
{
  # using split operator -split instead of chararray func .Split()
  $search = $line -split "href=`""
  
  foreach ($u in $search)
  {
    # adding all hrefs
    if ($u.startswith("http"))
    {
      # add everything from 0th element up to next quotation mark (")
      # https:example.com/q?query=getthis
      $allHrefs += $u.split("`"")[0]
    }
    else
    {
      continue
    }
  }
    # search speficifcally for pages of the target website
    # insert code here
    # ...
   
  # https://www.example.co.uk/q?...
  # http://account.example.co.uk/q?...
  foreach ($u in $allHrefs)
  {
    $uris = $u -split "://"
    
    if ($uris.contains($uri))
    {
      # www.example.co...
      # account.example...   
      if ($uris[1].startswith("www.$uri")) -or ($uris[1].startswith($uri))
      {
        $targetHrefs += $uris[1]
      }
      else {continue}
    }
    else {continue}
  }
}
