#!/usr/bin/env bash

cat <<EOF
# The repo admins team will be the default owners for everything in the repo.
# Unless a later match takes precedence, they will be requested for review when someone opens a pull request.

/.github/workflows/ @chenzhiguo
/renovate.json @chenzhiguo

EOF

for DIR in $(ls -1 -d ./charts/*)
do
  FILE="$DIR/Chart.yaml"
  DIR=$(echo $DIR | sed 's/^\.//')
  MAINTAINERS=$(yq e '.maintainers.[].name' $FILE| sed 's/^/@/' | sort --ignore-case)
  echo $DIR/ $MAINTAINERS
done
