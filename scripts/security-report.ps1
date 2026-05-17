# ================================================
# Full Local Security Report
# ================================================
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "   FULL SECURITY REPORT" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Host "Scan Time: $timestamp" -ForegroundColor White

# 1. Python scan
Write-Host "`n[1] Running Python Security Scan..." -ForegroundColor Yellow
pip install bandit -q
bandit -r app/ --severity-level medium

# 2. Dependency check
Write-Host "`n[2] Running Dependency Check..." -ForegroundColor Yellow
pip install safety==2.3.5 -q
safety check -r app/requirements.txt

# 3. Summary
Write-Host "`n=========================================" -ForegroundColor Green
Write-Host "   SCAN COMPLETE" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host "✅ Python Scan     - Complete" -ForegroundColor Green
Write-Host "✅ Dependency Scan - Complete" -ForegroundColor Green
Write-Host "Check reports/ folder for details" -ForegroundColor White