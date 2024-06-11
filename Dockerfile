# Verwende das offizielle Python-Basisimage
FROM python:3

# Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# Kopiere die Dateien deiner Anwendung in den Container
COPY . /app

# Installiere uWSGI
RUN pip install uwsgi

# Installiere die erforderlichen Python-Abhängigkeiten
RUN pip install -r requirements.txt

# Setze die Umgebungsvariable FLASK_APP auf den Namen deiner Anwendung
ENV FLASK_APP=app.py

# Setze den Pfad für uWSGI
ENV PATH="/usr/local/bin:${PATH}"

# Exponiere den Port 8000, auf dem der uWSGI-Server lauschen wird
EXPOSE 8000

# Starte die Flask-Anwendung mit uWSGI
CMD ["uwsgi", "--http", "0.0.0.0:8000", "--module", "app:app"]
