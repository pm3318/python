# -*- coding: utf-8 -*-
"""
Created on Thu Dec 21 17:29:00 2017

@author: ASUS
"""
from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return "Hello World!"
if __name__ == "__main__":
    app.run(debug=True)
