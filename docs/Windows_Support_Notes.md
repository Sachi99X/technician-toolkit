# Windows Support Notes

Commands below are commonly used for diagnosis. Open Terminal or Command Prompt with normal permissions first; use administrator permissions only when needed and understood.

## Basic system information
```powershell
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsArchitecture
```

## Check network configuration
```powershell
ipconfig /all
```

## Test connectivity
```powershell
ping 1.1.1.1
nslookup example.com
```

## Check Windows system files
Run in an elevated terminal when appropriate:
```powershell
sfc /scannow
```

If SFC reports repair issues, consult current Microsoft guidance before running additional repair commands.

## Review running processes
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, Id, CPU
```

## Review available disk space
```powershell
Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, SizeRemaining, Size
```

## Good practice
- Capture the exact error and time.
- Understand a command before running it.
- Prefer official Microsoft documentation.
- Avoid registry edits and destructive commands unless there is a clear reason, a backup, and authorization.
