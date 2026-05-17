# ================================================
# Secure Dockerfile - Security Best Practices
# ================================================

# Use specific version - never use 'latest'
FROM python:3.11-slim

# Security - Create non-root user
RUN groupadd -r appuser && \
    useradd -r -g appuser appuser

# Set working directory
WORKDIR /app

# Copy requirements first (better caching)
COPY app/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ .

# Security - Set file ownership
RUN chown -R appuser:appuser /app

# Security - Switch to non-root user
USER appuser

# Security - Don't expose unnecessary ports
EXPOSE 5000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:5000/health')"

# Run application
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]
