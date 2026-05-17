# ================================================
# Run Bandit Security Scan Locally
# ================================================
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "   PYTHON SECURITY SCAN - BANDIT" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# Install bandit if not installed
pip install bandit -q

# Run scan
Write-Host "[*] Scanning app/ folder..." -ForegroundColor Yellow
bandit -r app/ --severity-level medium

Write-Host "[+] Scan Complete!" -ForegroundColor Green