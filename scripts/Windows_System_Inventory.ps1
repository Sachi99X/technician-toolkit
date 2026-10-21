<#
.SYNOPSIS
    Collects a basic, read-only summary of this Windows computer.
.DESCRIPTION
    Displays OS, CPU, memory, and disk information. It does not change system settings.
.NOTES
    Run only on a computer you own or are authorized to inspect.
#>

$ErrorActionPreference = "SilentlyContinue"

Write-Host "`n=== Windows System Inventory ===" -ForegroundColor Cyan

$os = Get-CimInstance Win32_OperatingSystem
$computer = Get-CimInstance Win32_ComputerSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$memoryGB = [math]::Round($computer.TotalPhysicalMemory / 1GB, 2)

Write-Host "`nOperating System"
[PSCustomObject]@{
    Caption        = $os.Caption
    Version        = $os.Version
    Architecture   = $os.OSArchitecture
    LastBoot       = $os.LastBootUpTime
} | Format-List

Write-Host "Hardware"
[PSCustomObject]@{
    Manufacturer   = $computer.Manufacturer
    Model          = $computer.Model
    Processor      = $cpu.Name
    InstalledRAMGB = $memoryGB
} | Format-List

Write-Host "Disk Volumes"
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
    Select-Object DeviceID,
        @{Name="SizeGB";Expression={[math]::Round($_.Size / 1GB, 2)}},
        @{Name="FreeGB";Expression={[math]::Round($_.FreeSpace / 1GB, 2)}} |
    Format-Table -AutoSize

Write-Host "`nInventory complete. Review output before sharing it publicly." -ForegroundColor Green
