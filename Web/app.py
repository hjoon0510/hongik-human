from flask import Flask, render_template
from flask_cors import CORS, cross_origin

app = Flask(__name__)
# CORS(app, resources={r'*': {'origins': '*'}})
CORS(app)

@app.route("/")
def main():
    return render_template('index.html')

@app.route("/location1.html")
def main1():
    return render_template('location1.html')

@app.route("/location2.html")
def main2():
    return render_template('location2.html')

@app.route("/location3.html")
def main3():
    return render_template('location3.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=1010) # app.run()