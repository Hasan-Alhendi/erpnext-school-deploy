# Sites Documentation

## 1. erp.horizontechco.com

Main ERPNext site.

Purpose:

- General ERPNext usage
- Previous Education module testing
- Main ERPNext desk access

Expected apps:

- frappe
- erpnext
- arabic_translations
- education

## 2. almadina.horizontechco.com

Wood factory site.

Purpose:

- MDF door cutting
- Cutting plans
- DXF export
- Wood factory customization

Required custom app:

- wood_factory

Important note:

This site will not work if the Docker image does not contain apps/wood_factory.

Check installed apps:

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
bench --site almadina.horizontechco.com list-apps
'

Expected apps include:

- frappe
- erpnext
- arabic_translations
- wood_factory

## 3. school.horizontechco.com

School management site.

Purpose:

- School management
- Students
- Guardians
- Teachers
- Subjects
- Gradebooks
- Report cards
- Assessment schemes

Required custom app:

- school_management

Important note:

This site will not work if the Docker image does not contain apps/school_management.

Check installed apps:

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
bench --site school.horizontechco.com list-apps
'

Expected apps:

- frappe
- erpnext
- school_management

## Shared Docker Setup

All sites run inside the same Docker Compose project:

erpnext

All sites share the same bench and apps folder:

/home/frappe/frappe-bench/apps

All sites share the same sites volume:

/home/frappe/frappe-bench/sites

Therefore the Docker image must contain all custom apps needed by all sites:

- wood_factory
- school_management

## Current Working Docker Image

horizon/erpnext-school:v16.17.0-4

## Important Warning

Do not run:

docker compose down -v

Do not remove Docker volumes unless a full backup exists.

The important volumes are:

- frappe_docker_db-data
- frappe_docker_sites
- frappe_docker_redis-queue-data

## Common Checks

Check containers:

docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"

Check apps folder:

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
ls apps
'

Check global apps.txt:

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
cat sites/apps.txt
'
