
$path = $PSScriptRoot
$var = Get-ChildItem $path | Where-Object { $_.Mode -notlike "d*" -and  $_.Name -notlike "*.ps1" } 
foreach($i in $var)
{
    
   $req = Invoke-WebRequest -Uri http://127.0.0.1:8096/api/qiniu/uploadAndGetKey -Method POST -InFile ${path}\$i -TimeoutSec 10 -ContentType application/octet-stream
   Write-Host $i  $req.Content
}