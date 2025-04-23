from flask import Flask, request, jsonify
import cv2
import numpy as np
import base64

app = Flask(__name__)

@app.route('/face-check', methods=['POST'])
def face_check():
    data = request.get_json()
    image_data = data['image'].split(",")[1]
    nparr = np.frombuffer(base64.b64decode(image_data), np.uint8)
    img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

    face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, 1.1, 4)

    return jsonify({"faces_detected": len(faces)})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
