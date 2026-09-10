# Define the base path
$basePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID"

# Get all subkeys
$subKeys = Get-ChildItem -Path $basePath | Select-Object -ExpandProperty PSChildName

# Filter only those containing lowercase letters
$lowercaseKeys = $subKeys | Where-Object { $_ -cmatch "[a-z]" }

foreach ($targetKey in $lowercaseKeys) {
    # Build the full path
    $targetPath = Join-Path $basePath $targetKey

    # Get all values present in this key
    $values = Get-ItemProperty -Path $targetPath | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name

    if ($values.Count -gt 5) {
        foreach ($val in $values) {
            Remove-ItemProperty -Path $targetPath -Name $val -Force
        }
    }
    else {
        # Add a new value
        $valueName = "NewValue_" + (Get-Random -Minimum 1000 -Maximum 9999)
        New-ItemProperty -Path $targetPath -Name $valueName -Value "Test" -PropertyType String -Force | Out-Null
    }
}
