# Raw Data API

![Unit test](https://github.com/hotosm/raw-data-api/actions/workflows/Unit-Test.yml/badge.svg)
![Build](https://github.com/hotosm/raw-data-api/actions/workflows/build.yml/badge.svg)

**Documentation**: [hotosm.github.io/raw-data-api](https://hotosm.github.io/raw-data-api/)

**Source Code**: [github.com/hotosm/raw-data-api](https://github.com/hotosm/raw-data-api)

`Raw Data API ` is a set of high-performant APIs for transforming and exporting OpenStreetMap (OSM) data in different GIS file formats.

## Features

- **Fast**: Built on top of [FastAPI](https://fastapi.tiangolo.com/)
- OAUTH 2.0 Authentication with [OpenStreetMap(OSM)](https://openstreetmap.org)
- Multiple GIS formats support via [GDAL's ogr2ogr](https://gdal.org/programs/ogr2ogr.html) - see table below for currently supported formats. Out of which , GeoJSON Follows Own Raw Data API conversion script

  | Formats        | Status             |
  | -------------- | ------------------ |
  | Esri Shapefile | :heavy_check_mark: |
  | KML            | :heavy_check_mark: |
  | Mbtiles        | :heavy_check_mark: |
  | FlatGeoBuf     | :heavy_check_mark: |
  | CSV            | :heavy_check_mark: |
  | GeoPackage     | :heavy_check_mark: |
  | PGDUMP         | :heavy_check_mark: |
  | GeoJSON        | :heavy_check_mark: |

## Installation

#### To setup Backend Follow [Backend_Installation](./backend/Readme.md)

Raw Data API can be installed through `docker` or locally on your computer.

- To install with docker see [docker installation](./docs/src/installation/docker.md).
- To install locally, continue below.

NOTE: The installation guide below is only tested to work on Ubuntu, we recommend using docker for other operating systems.

### Local Installation Requirements.

- Install [GDAL](https://gdal.org/index.html) on your computer using the command below:

```
sudo apt-get update && \
sudo apt-get -y install gdal-bin python3-gdal && \
sudo apt-get -y autoremove && \
sudo apt-get clean

```

- Install [redis](https://redis.io/docs/getting-started/installation/) on your computer using the command below:

```
sudo apt-get -y install redis
sudo apt-get -y install redis-tools # For client
```

- Confirm Redis Installation

```
redis-cli
```

Type `ping` it should return `pong`.

If _redis_ is not running check out its [documentation](https://redis.io/docs/getting-started/)

- Clone the Raw Data API repository on your computer

```
git clone https://github.com/hotosm/raw-data-api.git
```

- Navigate to the repository directory

```
cd raw-data-api
```

- Install the python dependencies

```
pip install -r requirements.txt
```

### Additional required configurations for Raw Data API

Setup the necessary configurations for Raw Data API from [configurations](./docs/src/installation/configurations.md).

Setup config.txt in project root.

### Start the Server

```
uvicorn API.main:app --reload
```

### Start Celery Worker

You should be able to start [celery](https://docs.celeryq.dev/en/stable/getting-started/first-steps-with-celery.html#running-the-celery-worker-server) worker by running following command on different shell

```
celery --app API.api_worker worker --loglevel=INFO
```

### Start flower for monitoring queue [OPTIONAL]

Raw Data API uses flower for monitoring the Celery distributed queue. Run this command on a different shell , if you are running redis on same machine your broker could be `redis://localhost:6379//`.

```
celery --broker=redis://redis:6379// --app API.api_worker flower --port=5000
```

### Navigate to the docs to view Raw Data API endpoints

After sucessfully starting the server, visit [http://127.0.0.1:8000/v1/docs](http://127.0.0.1:8000/v1/docs) on your browser to view the API docs.

```
http://127.0.0.1:8000/v1/docs
```

Flower dashboard should be available on port `5000` on your localhost.

```
http://127.0.0.1:5000/
```

## Basic Usage

- Confirm that Authetication works

  1. Hit the `/auth/login/` endpoint
  2. Hit the `url` returned on the response
  3. You will get an `access_token`
  4. You can use the `access_token` in all endpoints that requires authentication.
  5. To check token pass token in /auth/me/. It should return your OpenStreetMap (OSM) profile

- Try extracting some data:

  You can use the `/raw-data/current-snapshot/` endpoint with the following input to check both authentication, database connection and download the export:

```
curl -d '{"geometry":{"type":"Polygon","coordinates":[[[83.96919250488281,28.194446860487773],[83.99751663208006,28.194446860487773],   [83.99751663208006,28.214869548073377],[83.96919250488281,28.214869548073377],[83.96919250488281,28.194446860487773]]]}}' -H 'Content-Type: application/json'   http://127.0.0.1:8000/v2/raw-data/current-snapshot/
```

## Tests

- Raw Data API uses pytest for tests, navigate to the root directory and install package in editable mode:

```
pip install -e .
```

- At this point you should have PostgreSQL + PostGIS extension enabled on your computer, now run Pytest:

```
py.test -v -s
```

- Running individual tests

```
py.test -k test function name
```

## Contribution & Development

see [CONTRIBUTING](./contributing.md)

## Workflow 
Understand how Raw Data API works and connected pieces , 
see [Workflow](./workflow.md)

## License

see [LICENSE](https://github.com/hotosm/raw-data-api/blob/develop/LICENSE)

## Authors

Created by [HOTOSM](https://hotosm.org) and [Friends](https://github.com/hotosm/raw-data-api/graphs/contributors)
