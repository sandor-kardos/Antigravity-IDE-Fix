# IDEBACK.ps1
# Antigravity IDE Fix Utility
# https://github.com/sandor-kardos/Antigravity-IDE-Fix

Clear-Host

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "             IDEBACK UTILITY            " -ForegroundColor Cyan
Write-Host "    Antigravity IDE Conflict Resolver   " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$targetDir = "$env:LOCALAPPDATA\Programs\Antigravity\resources"

Write-Host "[*] Validating target directory..." -ForegroundColor Gray

if (-Not (Test-Path -Path $targetDir)) {
    Write-Host "[!] Error: Target directory does not exist: $targetDir" -ForegroundColor Red
    Write-Host "[*] Script execution aborted." -ForegroundColor Gray
    Write-Host ""
    Write-Host "https://sandorkardos.com" -ForegroundColor Cyan
    Exit
}

Write-Host "[*] Target directory found: $targetDir" -ForegroundColor Green
Write-Host "[*] Checking for conflicting deployment packages..." -ForegroundColor Gray

$appDir = Join-Path -Path $targetDir -ChildPath "app"
$appAsar = Join-Path -Path $targetDir -ChildPath "app.asar"

$conflictResolved = $false

if (Test-Path -Path $appDir) {
    Write-Host "[!] Overriding 'app' directory detected. Neutralizing..." -ForegroundColor Yellow
    Rename-Item -Path $appDir -NewName "app.bak" -ErrorAction SilentlyContinue
    $conflictResolved = $true
}

if (Test-Path -Path $appAsar) {
    Write-Host "[!] Overriding 'app.asar' package detected. Neutralizing..." -ForegroundColor Yellow
    Rename-Item -Path $appAsar -NewName "app.asar.bak" -ErrorAction SilentlyContinue
    $conflictResolved = $true
}

if ($conflictResolved) {
    Write-Host "[+] Conflict resolution applied successfully." -ForegroundColor Green
} else {
    Write-Host "[*] No active conflicts detected or they have already been resolved." -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "         Execution Completed.           " -ForegroundColor Green
Write-Host "      https://sandorkardos.com          " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
