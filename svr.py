from sklearn import svm
import pandas

def predict(input):
    data = pandas.read_csv('solarpowergeneration.csv')
    data.dropna(inplace=True)

    X = data[data.columns[:-1]]
    Y = data['power-generated']

    clf = svm.SVR(kernel="rbf")
    clf.fit(X, Y)

    inputdata = {}
    i=0

    for x in data.columns[:-1]:
        inputdata[x] = float(input[i])
        i=i+1
    print(inputdata)
    input_data = pandas.DataFrame([inputdata])

    # print("Predicted Power: ", clf.predict(inputdata)[0])
    return str(clf.predict(input_data)[0])

