$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Dectect drchitecture (9 = x64 (AMD64), 12 = ARM64)
$osArch = (Get-CimInstance Win32_Processor).Architecture

if ($osArch -eq 12) {
    $url      = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.7.5/kubetail-windows-arm64'
    $checksum = 'a232dee5ecb351c623b6e9bf23b060e71b68739b8b9c00d5915b6dad1994634c'
}
else {
    $url      = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.7.5/kubetail-windows-amd64'
    $checksum = '94ea13b25845efb3c7694ea8c87021d0d0014ad683f9aff7eb7e50735125f908'
}

$packageArgs = @{
    PackageName    = 'kubetail'
    Url64bit       = $url
    Checksum64     = $checksum
    ChecksumType64 = 'sha256'
    FileFullPath   = "$toolsDir\kubetail.exe"
}

Get-ChocolateyWebFile @packageArgs
