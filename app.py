from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def hello_world():
    return render_template('index.html')

@app.route('/blog')
def blog():
    return render_template('experience.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)