 # ================================================
# Sample Web Application for Security Scanning
# ================================================
from flask import Flask, request, jsonify
import os

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "status": "running",
        "message": "Secure CI/CD Pipeline Demo App",
        "version": "1.0.0"
    })

@app.route('/health')
def health():
    return jsonify({"health": "ok"})

@app.route('/data', methods=['POST'])
def receive_data():
    data = request.get_json()
    if not data:
        return jsonify({"error": "No data provided"}), 400
    return jsonify({
        "received": True,
        "items": len(data)
    })

if __name__ == '__main__':
    # REMEDIATION: Default to safe localhost for local testing.
    # Production environments (like Docker/K8s) can inject HOST='0.0.0.0' via env vars.
    host = os.environ.get('HOST', '127.0.0.1')
    port = int(os.environ.get('PORT', 5000))
    
    app.run(host=host, port=port, debug=False)