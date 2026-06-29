#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."

: "${ERPNEXT_IMAGE:=horizon/erpnext-school:v16.17.0-5}"
: "${WOOD_FACTORY_REPO:=https://github.com/Hasan-Alhendi/wood_factory.git}"
: "${SCHOOL_MANAGEMENT_REPO:=https://github.com/Hasan-Alhendi/School-management.git}"

docker build --no-cache \
  -f Dockerfile.school \
  -t "$ERPNEXT_IMAGE" \
  --build-arg WOOD_FACTORY_REPO="$WOOD_FACTORY_REPO" \
  --build-arg SCHOOL_MANAGEMENT_REPO="$SCHOOL_MANAGEMENT_REPO" \
  .
