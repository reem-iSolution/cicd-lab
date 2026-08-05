from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    return "v2 - hello from CI"


@app.route("/health")
def health():
    return "v2 - hello from CI"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)