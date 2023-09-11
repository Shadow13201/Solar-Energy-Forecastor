from flask import Flask, render_template, request, jsonify

from svr import predict

app = Flask(__name__)

input = []


@app.route('/predict', methods=['POST'])
def process_data():
    input.clear()
    # field1 = request.form['field1']
    # field2 = request.form['field2']
    # field3 = request.form['field3']
    # field4 = request.form['field4']
    # field5 = request.form['field5']
    # field6 = request.form['field6']
    # field7 = request.form['field7']
    # field8 = request.form['field8']
    # field9 = request.form['field9']

    input.append(request.form['field1'])
    input.append(request.form['field2'])
    input.append(request.form['field3'])
    input.append(request.form['field4'])
    input.append(request.form['field5'])
    input.append(request.form['field6'])
    input.append(request.form['field7'])
    input.append(request.form['field8'])
    input.append(request.form['field9'])

    print(input)

    # Perform necessary processing on input_value
    result = process_input(input)

    return result


def process_input(input_value):
    # Process the input value and return the result
    a = predict(input_value)
    print(a)
    return a


if __name__ == '__main__':
    app.run(host='192.168.43.187', port='8080')
