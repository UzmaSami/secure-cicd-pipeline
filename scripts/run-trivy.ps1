# ================================================
# Run Trivy Container Scan Locally
# ================================================
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "   CONTAINER SECURITY SCAN - TRIVY" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# Check if Docker is running
$docker = docker info 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "[!] Docker is not running. Please start Docker." -ForegroundColor Red
    exit 1
}

# Build image
Write-Host "[*] Building Docker image..." -ForegroundColor Yellow
docker build -f docker/Dockerfile -t secure-app:local .

# Run Trivy scan
Write-Host "[*] Running Trivy scan..." -ForegroundColor Yellow
docker run --rm `
    -v //./pipe/docker_engine://./pipe/docker_engine `
    aquasec/trivy:latest image `
    --severity HIGH,CRITICAL `
    secure-app:local

Write-Host "[+] Container scan complete!" -ForegroundColor Green