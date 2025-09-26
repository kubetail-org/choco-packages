$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Dectect drchitecture (9 = x64 (AMD64), 12 = ARM64)
$osArch = (Get-CimInstance Win32_Processor).Architecture

if ($osArch -eq 12) {
    $url      = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.8.2/kubetail-windows-arm64'
    $checksum = '23c5ccbe927170a79e3d833647c0ad5288b492d8d33c4c48ab7e63bfcbf0dc32'
}
else {
    $url      = 'https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.8.2/kubetail-windows-amd64'
    $checksum = 'c7626e7d1911ed73f2b538ddf8ef11581011e2adb8963780b83dac7766b0fb3b'
}

$packageArgs = @{
    PackageName    = 'kubetail'
    Url64bit       = $url
    Checksum64     = $checksum
    ChecksumType64 = 'sha256'
    FileFullPath   = "$toolsDir\kubetail.exe"
}

Get-ChocolateyWebFile @packageArgs
