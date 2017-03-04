# obtain single file
#wget "http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug.zip" -OutFile "drug.zip"
# Get present location
$currentDir = Get-Location
# Obtain all files
$dpd_allfiles = "allfiles.zip"
wget ("http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/" + $dpd_allfiles) -OutFile $dpd_allfiles
# http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/allfiles.zip

# Unzip the file
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

# Unzip the archive
Unzip $currentDir"\$($dpd_allfiles)" $currentDir"\"

# Remove the zip archive
Remove-Item $dpd_allfiles

# Dir Listing after file received
Get-ChildItem .\
