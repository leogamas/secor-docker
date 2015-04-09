#!/bin/bash

set -e

if [ "$1" = 'consumer' ]; then
  java -ea -Dsecor_group=${SECOR_GROUP} -Dlog4j.configuration=log4j.prod.properties -Dconfig=secor.prod.backup.properties -cp secor-0.1-SNAPSHOT.jar:lib/* com.pinterest.secor.main.ConsumerMain
fi

exec "$@"

