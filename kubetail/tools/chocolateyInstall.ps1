$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Dectect drchitecture (9 = x64 (AMD64), 12 = ARM64)
$osArch = (Get-CimInstance Win32_Processor).Architecture

if ($osArch -eq 12) {
    $url      = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.8.0/kubetail-windows-arm64'
    $checksum = 'e8106f7773b4d9b3f95443435b1a3aea054e23f87afa6cc06f328766f0dc3489'
}
else {
    $url      = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.8.0/kubetail-windows-amd64'
    $checksum = 'd460ffca614dd730f096325f911d1444703c884339b59c102f0e54695a9c6f3c'
}

$packageArgs = @{
    PackageName    = 'kubetail'
    Url64bit       = $url
    Checksum64     = $checksum
    ChecksumType64 = 'sha256'
    FileFullPath   = "$toolsDir\kubetail.exe"
}

Get-ChocolateyWebFile @packageArgs
