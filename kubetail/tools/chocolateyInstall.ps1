$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName    = 'kubetail'
    Url64bit       = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.5.1/kubetail-windows-amd64'
    Checksum64     = '62ba194983d037ebe123b0ff4adc418ef301418367557591a26c5ba2021a15f1'
    ChecksumType64 = 'sha256'
    FileFullPath   = "$toolsDir\kubetail.exe"
}

Get-ChocolateyWebFile @packageArgs
