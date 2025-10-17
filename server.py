from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/emit', methods=['POST'])
def emit():
    data = request.get_json()
    print("[INFO] Alexa Sync Event:", data)
    return jsonify({"ok": True, "emitted": data})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3210)
