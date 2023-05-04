
#Script Setup
#Setup Infinite Loop
$loop = 1;

#Web Traffic Setup
#Disable SSL cache in registry
New-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name DisableCachingOfSSLPages -Value "1" -PropertyType DWORD -Force
$IE=new-object -com internetexplorer.application
$IE.visible = $true

#Documents Setup
$docsFolder1 = "c:\TrafficDocs"
$docsFolder2 = "c:\TrafficDocs2"
IF (Test-Path $docsFolder1) {Write-Host $docsFolder " already exists";}ELSE{New-Item -ItemType Directory -Force -Path $docsFolder;Write-Host "created";}
IF (Test-Path $docsFolder2) {Write-Host $docsFolder2 " already exists";}ELSE{New-Item -ItemType Directory -Force -Path $docsFolder2;Write-Host "created";}
$word = New-Object -ComObject word.application
$word.Visible = $true

#webTraffic
function browsePage
{
$sleep = (Get-Random -input "10", "7", "5", "3", "1")
$website = (Get-Random -input "www.cnn.com", "www.facebook.com", "www.twitter.com", "www.cars.com", "www.iase.disa.mil", "www.wikipedia.com", "www.yahoo.com", "www.google.com", "www.gmail.com", "www.carmax.com", "www.allstate.com", "www.blockbuster.com", "www.walmart.com")
$IE.navigate2($website)
$IE.visible=$true
Start-Sleep -s $sleep
}

#generateDoc
function createDoc
{
$docSleep = (Get-Random -input "10", "7", "5", "3", "1")
$currentFolder = (Get-Random -input $docsFolder1, $docsFolder2)
$unique = [System.Guid]::NewGuid().toString()
$short = $unique.Substring(0,4)
$docName = "Document_" + $short
$fullPath = $currentFolder + "\" + $docName
$max = 100
$randSize = (Get-Random -Minimum 1 -Maximum $max)

$content = (Get-Content C:\randomText.txt -TotalCount $randSize)

$doc = $word.documents.add()
$select = $word.Selection
$select.TypeParagraph()
$select.TypeText($content)

$doc.SaveAs([ref]$fullPath, [ref]$saveFormat::wdFormatdocument)
Write-Host $docName " Created in " $currentFolder " and the full path is " $fullPath
Start-Sleep -s $docSleep
$doc.Close()
}

#Traffic
while ($loop -ne 0)
{
$trafficType = (Get-Random -input "1", "2")
IF ($trafficType -eq "1") {browsePage}
ELSE {
IF ($trafficType -eq "2") {createDoc}
ELSE{}
}
}

