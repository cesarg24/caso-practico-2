from flask import Flask
import os

app = Flask(__name__)
DATA_FILE = "/data/visitas.txt"

@app.route("/")
def index():
    # Lee y escribe en el volumen persistente
    if os.path.exists(DATA_FILE):
        with open(DATA_FILE, "r") as f:
            visitas = int(f.read())
    else:
        visitas = 0
    visitas += 1
    with open(DATA_FILE, "w") as f:
        f.write(str(visitas))
    return f"""
    <h1>Caso Practico 2 - App Kubernetes</h1>
    <p>Visitas: {visitas}</p>
    <p>Almacenamiento persistente: /data/visitas.txt</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)