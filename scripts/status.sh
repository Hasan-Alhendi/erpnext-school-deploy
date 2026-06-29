#!/usr/bin/env bash
set -e

echo "===== Docker containers ====="
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"

echo
echo "===== Bench apps ====="
docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
echo "--- apps folder ---" &&
ls apps &&
echo "--- sites/apps.txt ---" &&
cat sites/apps.txt
'

echo
echo "===== Sites ====="
docker exec -it erpnext-backend-1 bash -lc '
cd /home/frappe/frappe-bench &&
echo "--- almadina ---" &&
bench --site almadina.horizontechco.com list-apps || true &&
echo "--- school ---" &&
bench --site school.horizontechco.com list-apps || true
'
