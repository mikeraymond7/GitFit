'''
To run:
    FLASK_APP=hello.py flask run
'''
import os
from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore, initialize_app

app = Flask(__name__)

cred = credentials.Certificate('key.json')
default_app = initialize_app(cred)
db = firestore.client()
users_ref = db.collection('users')
stats_ref = db.collection('stats')
lifts_ref = db.collection('lifts')


# https://medium.com/google-cloud/building-a-flask-python-crud-api-with-cloud-firestore-firebase-and-deploying-on-cloud-run-29a10c502877
@app.route('/updateUsers', methods=['POST'])
def updateUsers():
        try:
                uname = request.json['uname']
                print(request.json)
                users_ref.document(uname).set(request.json)
                return jsonify({"success": True}), 201
        except Exception as e:
                return f"An Error Occured: {e}."
        

@app.route('/updateStats', methods=['POST', 'PUT'])
def updateStats():
        try:
                uname = request.json['uname']
                stats_ref.document(uname).update(request.json)
                return jsonify({"success": True}), 201
        except Exception as e:
                return f"An Error Occurred: {e}."

@app.route('/updateLifts', methods=['POST', 'PUT'])
def updateLifts():
        try:
                uname = request.json['uname']
                lifts_ref.document(uname).update(request.json)
                return jsonify({"success": True}), 201
        except Exception as e:
                print(request.json)
                return f"An Error Occurred: {e}."

@app.route('/setLifts', methods=['POST', 'PUT'])
def setLifts():
        try:
                uname = request.json['uname']
                lifts_ref.document(uname).set(request.json)
                return jsonify({"success": True}), 201
        except Exception as e:
                return f"An Error Occurred: {e}."

@app.route('/getLifts', methods=['GET'])
def getLifts():
        try:
                uname = request.args.get('uname')
                if uname:
                        stats = lifts_ref.document(uname).get()
                        return jsonify(stats.to_dict()), 201
                else:
                        all_stats = [doc.to_dict() for doc in lifts_ref.stream()]
                        return jsonify(all_stats), 200
        except Exception as e:
                return f"An Error Occurred: {e}."

@app.route('/getStats', methods=['GET'])
def getStats():
        try:
                uname = request.args.get('uname')
                if uname:
                        stats = stats_ref.document(uname).get()
                        return jsonify(stats.to_dict()), 201
                else:
                        all_stats = [doc.to_dict() for doc in stats_ref.stream()]
                        return jsonify(all_stats), 200
        except Exception as e:
                return f"An Error Occurred: {e}."

if __name__ == '__main__':
        app.run()
