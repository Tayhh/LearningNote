# 第一步是用sklearn建模。
from sklearn.tree import DecisionTreeClassifier
import pandas as pd
from pickle import dump
df = pd.read_csv('iris.csv')
X = df.ix[:,:4].values
y = df.ix[:,4].values
model = DecisionTreeClassifier()
model.fit(X,y)

# 第二步是将模型写入到pickle文件中
dump(model, open('model.pickle','wb'))

# 第三步是构建一个API，写一个server.py文件
from flask import Flask, request
from flask.ext.restful import Resource, Api
import numpy as np
from pickle import load
from sklearn.tree import DecisionTreeClassifier

app = Flask(__name__)
api = Api(app)
model = load(open('model.pickle','rb'))

class TodoSimple(Resource):
    def put(self, todo_id):
        newx = eval(request.form['data'])
        newx = np.array(newx)
        res = model.predict(newx)
        return res.tolist()

api.add_resource(TodoSimple, '/')

if __name__ == '__main__':
    app.run(debug=True)

# 保存好py文件后启用它
python server.py

# API会在如下地址监听
Running on http://127.0.0.1:5000/

# 第四步是调用这个API。另开一个终端，输入
curl http://localhost:5000/todo1 -d "data=[4.9,3.,1.4,0.2]" -X PUT

# 成功返回
[
    "setosa"
]

# 也可以在python中实验。
from request import put
put('http://localhost:5000/m1', data={'data': '[ 4.9, 3. , 1.4, 0.2]'}).json()
