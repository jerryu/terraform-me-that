from flask import Flask
import json

app = Flask(__name__)

@app.route("/")
def index():
  howdy = { "greeting" : { "English": "hello world" } }
  return json.dumps(howdy)

if __name__ == "__main__":
  app.run(host='0.0.0.0', port=8080, debug=False)
