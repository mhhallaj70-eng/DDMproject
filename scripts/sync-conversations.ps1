# Sync script - by Claude scheduled task فراخوانی میشود
# این اسکریپت تغییرات پوشه conversations را کامیت و push می‌کند

$ErrorActionPreference = "Stop"
Set-Location "C:\Users\mhhal\Documents\Claude\Projects\DDM"

# اگر تغییری نیست، خروج
$changes = git status --porcelain
if (-not $changes) {
    Write-Host "No changes to commit."
    exit 0
}

git add .
$date = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "Auto-sync conversations: $date"

# Push اگه remote تنظیم شده
$hasRemote = git remote 2>$null
if ($hasRemote) {
    git push
    Write-Host "Pushed to remote." -ForegroundColor Green
} else {
    Write-Host "No remote configured. Run: git remote add origin <url>" -ForegroundColor Yellow
}
