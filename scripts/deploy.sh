#!/usr/bin/env bash
set -e

cd /opt/erpnext/gitops

docker compose -p erpnext up -d --remove-orphans

docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"
