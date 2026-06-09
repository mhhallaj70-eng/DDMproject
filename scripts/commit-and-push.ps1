# DDM — Commit & Push
# اجرا از داخل پوشه DDM در PowerShell:
#   cd "C:\Users\mhhal\Documents\Claude\Projects\DDM"
#   .\scripts\commit-and-push.ps1

$ErrorActionPreference = "Stop"
$repoPath = "C:\Users\mhhal\Documents\Claude\Projects\DDM"

Set-Location $repoPath

# حذف lock file اگر باشه
$lockFile = ".git\index.lock"
if (Test-Path $lockFile) {
    Write-Host "Removing stale lock file..." -ForegroundColor Yellow
    Remove-Item -Force $lockFile
}

git add -A
git commit -m "docs: reorganize repo — README v3, archive kpi-v2, add 1404/features index"
git push origin main

Write-Host ""
Write-Host "Done! Pushed to GitHub." -ForegroundColor Green
