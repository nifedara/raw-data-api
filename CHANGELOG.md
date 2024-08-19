## 1.5.0 (2024-08-19)

### Feat

- **download-metrics**: enabels user to fetch and download metrics for rawdataapi

## 1.4.6 (2024-08-09)

### Fix

- **unit-test-failing**: only add file format if tiles are enabled

### Perf

- **test-cases**: don't run if task is failed

## 1.4.5 (2024-08-09)

### Fix

- **mvt-tiles**: fixes zoom level and zipping method for mvt tiles

## 1.4.4 (2024-08-09)

### Fix

- **security-patch-task-result**: don't raise the error to user when task status is being returned

## 1.4.3 (2024-08-08)

### Fix

- **mvt-format**: fix bug on mvt formats invalid command line args

## 1.4.2 (2024-08-08)

### Fix

- **fix-zoom-level-bug-on-pmtiles**: adds proper syntax on vector tiles exports zoom level

## 1.4.1 (2024-08-08)

### Fix

- **change-default-db-user-to-user-column**: default user was being used for db query instead read it from table itself
- **fix-on-dir-size-issue**: failing exports causing dir to explode

### Refactor

- **init-default-values**: reinitialize the default value as other endpoints don't require parameters

## 1.4.0 (2024-08-08)

### Feat

- **streaming-response-for-api**: adds streaming response for current snapshot plain
- **userinfo-on-exports**: adds userinfo in exports only for logged in users
- **vector-tiles**: support for vector tiles , allow user to select all tags in select
- **dockerfile**: minimizes docker image size  and introduces new version of gdal which should enable the latest vector driver support
- **custom_exports-yaml**: adds a yaml endpoint for custom exports

### Fix

- **fixes-failing-test-cases**: moves user checking to base class
- **wild-card-select**: fixes bug on wild card select for the query builder

### Refactor

- **cleanup-previous-non-async-code**: removes non async code for the quick fetch
- **yaml-models**: refactor model to models.py
- **custom-exports-yaml**: added geometry and both yaml validation

### Perf

- **custom-exports-yaml**: moves geometry to request body within yaml itself instead of query param

## 1.3.0 (2024-06-06)

### Feat

- **polygon-stats**: let admin and staff bypass the area limit

### Fix

- **iso3-stats**: fix bug on iso3 stats after the role check

## 1.2.2 (2024-05-02)

### Fix

- **api_worker**: clean dir when task fails

## 1.2.1 (2024-04-29)

### Fix

- **hdx-lib**: upgraded the hdx lib to fix last-modified bug

## 1.2.0 (2024-04-05)

### Feat

- **countries**: adds cid country get endpoint

## 1.1.3 (2024-04-05)

### Fix

- **test_api**: unittest fix for plain endpoint

## 1.1.2 (2024-04-04)

### Perf

- **s3downloadlink**: changes download link to support ipv6

## 1.1.1 (2024-03-29)

### Fix

- **stats**: adds area threshold in the stats api along with timeout reduced to 30 second

## 1.1.0 (2024-03-28)

### Feat

- **version-control**: Allows rawdataapi to follow version control using commitizen

### Fix

- **dokcer-compose**: One command up docker compose method
- **dockerfile**: Avoids copying tippicone for source code level changes

### Refactor

- **logging**: adds tqdm for better logging and upgrades hdx python lib
- **queue-name**: changes queue name and workers to pick correct variable
- **api-worker**: logic changes for memory optimized zip

### Perf

- **workers**: enables max worker variable to be set from env variable

## 1.0.17 (2024-03-06)

### Fix

- add optional param to wrap flatgeobuf in geomcollection
- default add spatial index to generated flatgeobuf files

### Refactor

- remove ENCODING param for flatgeobuf (does nothing)
- use f-string for flatgeobuf ogr command

## 1.0.16 (2022-12-19)

## 1.0.15 (2022-12-13)

## 1.0.14 (2022-12-13)

## 1.0.13 (2022-12-07)

## 1.0.12 (2022-12-07)

## 1.0.11 (2022-12-07)

## 1.0.10 (2022-12-07)

## 1.0.9 (2022-12-07)

## 1.0.8 (2022-12-07)

## 1.0.7 (2022-12-04)

## v1.0.6 (2022-09-15)

## v1.0.5 (2022-09-09)

## v1.0.4 (2022-08-02)

## v1.0.3 (2022-08-01)

## v1.0.2 (2022-08-01)

## v1.0.1 (2022-07-29)

## v1.0.0 (2022-07-29)
