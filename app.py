
from flask import Flask, request, jsonify, render_template, url_for
import pickle

#load the model
filename = 'model.pkl'
clf = pickle.load(open(filename, 'rb'))
vec = pickle.load(open('vectorizer.pkl', 'rb'))

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    if request.method == 'POST':
        message = request.form['message']
        data = [message]
        vect = vec.transform(data).toarray()
        my_prediction = clf.predict(vect)
        if my_prediction == 0:
            prediction = "You have logical thinking...It is based upon the intellectual comprehension of things through analysis and logical inference."
        else:
            prediction = "you have priority for feelings..It involves judging the value of things or having an opinion about them based on our likes and dislikes."

    return render_template('index.html', result='Personality: {}'.format(prediction), message = message)

if __name__ == ('__main__'):
    app.run(host ='0.0.0.0', port = 5001, debug = True) 