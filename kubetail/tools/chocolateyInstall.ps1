$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# helper from Chocolatey; returns 'X86', 'X64' or 'Arm64'
$osArch = Get-OSArchitecture

if ($osArch -eq 'Arm64') {
    $url      = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.7.3/kubetail-windows-arm64'
    $checksum = '59d63dda2d11f5dc55ef120c7dbac7e7e1daa5ffef93f262d7746d624183c564'
}
else {
    $url      = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.7.3/kubetail-windows-amd64'
    $checksum = 'e56bfd0418281719e579a83f00ab7d32957ef9739fcc4637de5499f5507a0725'
}

$packageArgs = @{
    PackageName    = 'kubetail'
    Url64bit       = $url
    Checksum64     = $checksum
    ChecksumType64 = 'sha256'
    FileFullPath   = "$toolsDir\kubetail.exe"
}

Get-ChocolateyWebFile @packageArgs
