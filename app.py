from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/berechnen', methods=['POST'])
def berechnen():
    try:
        summe = float(request.form['summe'])
        anzahl = int(request.form['anzahl'])
        ergebnis = summe / anzahl
        message = f"Jeder muss {ergebnis:.2f} € zahlen!"
    except (ValueError, ZeroDivisionError):
        message = "Bitte gib gültige Zahlen ein und stelle sicher, dass die Anzahl der Personen größer als 0 ist."
    
    return render_template('result.html', message=message)

if __name__ == '__main__':
    app.run(debug=True)
