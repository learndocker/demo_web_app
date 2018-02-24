#!/bin/bash
set -e
function copy_artifacts {
  mkdir -p /tmp/artifacts
  CONTAINER_ID=$(docker-compose ps -q app)
  docker cp ${CONTAINER_ID}:/tmp/rspec.xml /tmp/artifacts/rspec.yml
}

docker-compose up -d app
docker-compose exec app \
  bundle exec rspec --format progress --format RspecJunitFormatter --out /tmp/rspec.xml
STATUS=$?
copy_artifacts
exit ${STATUS}
