from flask import Flask

app = Flask(__name__)
@app.route('/')
def hello():
    return '''
<title>Популярные в россии поисковые системы</title>
<a href="http://yandex.ru">Yandex</a>
<a href="http://google.com">Google</a>
<a href="http://mail.ru">Mail.Ru</a>
'''
