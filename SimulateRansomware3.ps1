$TARGETPATH = [Environment]::GetFolderPath("MyDocuments")
$TARGETDIR = "$TARGETPATH\EncryptionTest\"
if(!(Test-Path -Path $TARGETDIR)){
    New-Item -ItemType directory -Path $TARGETDIR
}
GCI $TARGETDIR | Remove-Item -Force
1..2 | % { 
    $TARGETFILE = $TARGETDIR + $_ + ".txt";
    Out-File $TARGETFILE
    for ($i=1; $i -le 4096; $i++) {
        -join ((33..122) | Get-Random -Count 1 | % {[char]$_}) | Add-Content $TARGETFILE 
        }
    }