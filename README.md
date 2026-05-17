# 🔒 Secure CI/CD Pipeline - DevSecOps Implementation

## Overview
A production-grade secure CI/CD pipeline that automatically scans
code for vulnerabilities, secrets, and security issues on every
code push using GitHub Actions.

## Security Scans Included
- ✅ Bandit - Python static security analysis
- ✅ TruffleHog - Secrets and credentials detection
- ✅ Trivy - Container vulnerability scanning
- ✅ Safety - Python dependency vulnerability check
- ✅ pip-audit - Weekly automated dependency audit

## Pipeline Triggers
- Every push to main or develop branch
- Every pull request to main branch
- Weekly automated dependency scan (Mondays 9AM UTC)

## Technologies
- GitHub Actions
- Docker
- Bandit, Trivy, TruffleHog, Safety
- Python / Flask
- PowerShell

## How to Run Locally
'''powershell
pip install bandit safety flask
.\scripts\run-bandit.ps1
.\scripts\security-report.ps1
'''

## Author
Uzma Shabbir — Cloud Security Engineer
