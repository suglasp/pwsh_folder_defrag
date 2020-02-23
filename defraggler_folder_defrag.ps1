
#
# Pieter De Ridder
# Defrag CLI tool
#
# Uses Defraggler software, so make sure to install it on the machine you run this script.
# Defraggler includes a cli tools, that makes it possible to defrag a certain folder, or path.
#
# Usage: Defrag-Disk -DefragPath <local path>
# 

# include installation path
$env:path += ";C:\Program Files\Defraggler"

#
# Function : Defrag-Disk
# Defrags disk paths using Defraggler CLI tool
#
Function Defrag-Disk
{
    Param (
        [string]$DefragPath
    )

    Write-Host "-- Defragging path $($DefragPath)"
    Set-Location -Path $DefragPath
    Get-ChildItem -Path ./ -Directory | where { $args = @( "/S", $_.Name ); Write-Host " DIR $($_.Name)"; Start-Process -FilePath df64.exe -ArgumentList $args -Wait }
}


# -- some example paths to defrag
Defrag-Disk -DefragPath "C:\"
Defrag-Disk -DefragPath "$($env:windir)"
