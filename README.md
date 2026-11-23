# Loslegen

## Datensätze herunterladen
* Spiegel: https://ilias.studium.kit.edu/ilias.php?baseClass=ilrepositorygui&cmdNode=xu:ng&cmdClass=ilObjFileGUI&cmd=sendfile&ref_id=3084161

* Guardian: https://bwsyncandshare.kit.edu/s/LjxGXoZZR3EWS6T



## Abhängigkeiten installieren
**Mit uv**
````
uv sync
````
**Alternativ**
````
pip install -r requirements.txt
````

## Ordnerstruktur
```
.
├── data
│   ├── guardian_articles
│   │   └── *.json
│   └── spiegel_articles
│       └── *.json
├── docker
│   ├── Dockerfile
│   └── docker-compose.yml
├── sql
│   ├── queries_guardian
│   │   └── *.sql
│   ├── queries_spiegel
│   │   └── *.sql
│   ├── templates_guardian
│   │   └── *.sql
│   └── templates_spiegel
│       └── *.sql
├── src
│   └── *.py
├── .gitignore
├── .python-version
├── pyproject.toml
├── README.md
├── requirements.txt
└── uv.lock
```


## Docker Container bauen (nur einmal nötig)
````
cd docker
docker compose up -d --build
````

## Docker Container starten
````
cd docker
docker compose up -d
````

## Tabellen bauen
**Mit uv**
````
cd ..
uv run src/build_tables.py
````
**Alternativ**
````
cd ..
python3 src/build_tables.py
````

## Beispiel PGBench Template Starten
**Template:** sql/templates_guardian/simple_filtering.sql
````
docker compose -f docker/docker-compose.yaml exec -T db pgbench -U postgres -n -f /dev/stdin -c 4 -T 30 -r postgres < sql/templates_guardian/simple_filtering.sql
````

## Docker Container stoppen
````
cd docker
docker compose down -v
````