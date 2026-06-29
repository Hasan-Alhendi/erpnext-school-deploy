# ERPNext School Deploy

This repository stores deployment configuration for the ERPNext multi-site setup.

## Server Path

Main deployment path on the server:

/opt/erpnext/gitops

Backup/deployment documentation path:

/opt/erpnext/erpnext-school-deploy

## Docker Project

Project name:

erpnext

Important command:

docker compose -p erpnext up -d --remove-orphans

Do not run docker compose without -p erpnext on this server.

## Sites

- erp.horizontechco.com
- almadina.horizontechco.com
- school.horizontechco.com

## Custom Apps

- wood_factory
- school_management

## Base Image

horizon/erpnext-arabic:v16.17.0-education

## Current Working Image

horizon/erpnext-school:v16.17.0-4

## Repositories

wood_factory:

https://github.com/Hasan-Alhendi/wood_factory.git

school_management:

https://github.com/Hasan-Alhendi/School-management.git

## Important Files

Docker Compose:

docker-compose.yml

Custom Dockerfile:

Dockerfile.school

Nginx configs:

nginx/

Scripts:

scripts/

Documentation:

docs/

## Real Server .env

The real .env file is stored on the server at:

/opt/erpnext/gitops/.env

Do not commit the real .env file to GitHub.

It should contain values like:

COMPOSE_PROJECT_NAME=erpnext
ERPNEXT_IMAGE=horizon/erpnext-school:v16.17.0-4
MYSQL_ROOT_PASSWORD=real_password_here

## Do Not Commit

Never commit:

- .env
- .db_admin_password
- site_config.json
- common_site_config.json
- database backups
- Docker volumes
- SSL private keys
- passwords
- tokens
- local_apps
- backups

## Build Image

Use only when you intentionally want to build a new image:

cd /opt/erpnext/erpnext-school-deploy
cp .env.example .env
nano .env
source .env
./scripts/build_image.sh

## Deploy

Use only when you intentionally want to apply docker-compose changes:

cd /opt/erpnext/gitops
docker compose -p erpnext up -d --remove-orphans

## Status Check

From this repository:

./scripts/status.sh

Or manually:

docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
ls apps &&
cat sites/apps.txt
'

## Useful Site Commands

List apps for almadina:

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
bench --site almadina.horizontechco.com list-apps
'

List apps for school:

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
bench --site school.horizontechco.com list-apps
'

Migrate almadina:

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
bench --site almadina.horizontechco.com migrate &&
bench --site almadina.horizontechco.com clear-cache
'

Migrate school:

docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
bench --site school.horizontechco.com migrate &&
bench --site school.horizontechco.com clear-cache
'
