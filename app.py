from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def home():
    version = os.getenv('APP_VERSION', 'N/A')
    return render_template('index.html', version=version)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
