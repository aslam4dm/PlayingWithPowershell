# Modify to take arguments - where user can choose whether they want to collect all domains, subdomains or specific target domains 
# Use functions to better organise code

# use .split() to split by single character | use -split "xyz" to split by string

$uri = Read-Host "Enter a valid URI"


 if ($uri.contains("."))
 {
   $uriBaseTemp = $uri.split("`.")
 }
 $uriBase = $uriBaseTemp[0]

 $outfile = "output.txt"
 [int]$numOfLinesWithUri = 0

 Invoke-WebRequest -uri $uri -outfile $outfile

 foreach($line in cat $outfile)
 {
   if ($line.contains($uri))
   {
     $numOfLinesWithUri += 1
   }
 }

 # Search for hrefs e.g. abcd href="https://example.com/q?query=getthis"<><>...
 $allHrefs = @()
 $targetHrefs = @()
 $s1 = cat $outfile
 $search = $s1 -split "href=`""
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

   # https://www.example.co.uk/q?...
   # http://account.example.co.uk/q?...
   foreach ($u in $allHrefs)
   {
     $uris = $u -split "://"

     if (($uris[1].startswith("www.$uriBase")) -or ($uris[1].startswith($uriBase)))
     {
         $targetHrefs += $uris[1]
     }
     else {continue}
   }

 foreach ($l in $allHrefs){write-host $l}
 write-host "`n"
 foreach ($l in $targetHrefs){write-host $l}
