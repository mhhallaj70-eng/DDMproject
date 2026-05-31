# Setup script for DDM conversation archive
# اجرا در PowerShell از داخل پوشه DDM:
#   cd "C:\Users\mhhal\Documents\Claude\Projects\DDM"
#   .\setup-git.ps1

$ErrorActionPreference = "Stop"

Write-Host "=== DDM Git Setup ===" -ForegroundColor Cyan

# پاک کردن .git خراب در صورت وجود
if (Test-Path .git) {
    Write-Host "Removing broken .git folder..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force .git
}

# Init
Write-Host "Initializing git repository..." -ForegroundColor Green
git init -b main
git config user.email "lpln.psdk70@gmail.com"
git config user.name "DDM"

# Add and commit
git add .
git commit -m "Initial commit: DDM conversation archive"

Write-Host ""
Write-Host "=== Done! ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "حالا یک ریپوی خالی روی GitHub بسازید (بدون README/license):" -ForegroundColor White
Write-Host "  https://github.com/new" -ForegroundColor Yellow
Write-Host ""
Write-Host "بعد این دستورات رو اجرا کنید (آدرس رو با مال خودتون عوض کنید):" -ForegroundColor White
Write-Host '  git remote add origin https://github.com/USERNAME/ddm-conversations.git' -ForegroundColor Yellow
Write-Host '  git push -u origin main' -ForegroundColor Yellow
