﻿# obtain single file
#wget "http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug.zip" -OutFile "drug.zip"

# Obtain all files
$dpdAllFiles = "allfiles.zip"
wget ("http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/" + $dpdAllFiles) -OutFile $dpdAllFiles
# http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/allfiles.zip

# Unzip the file
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

# Unzip the archive
Unzip "C:\Dev\$($dpdAllFiles)" "C:\Dev\"

# Remove the zip archive
Remove-Item $dpdAllFiles

# Dir Listing after file received
Get-ChildItem .\