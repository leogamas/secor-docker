#!/bin/bash

set -e

if [ "$1" = 'consumer' ]; then
  java -ea -Dsecor_group=${SECOR_GROUP} \
	-Daws.access.key=${AWS_ACCESS_KEY} \
	-Daws.secret.key=${AWS_SECRET_KEY} \
	-Dzookeeper.quorum=${ZK_QUORUM} \
	-Dkafka.seed.broker.host=${SEED_BROKER_HOST} \
	-Dkafka.seed.broker.port=${SEED_BROKER_PORT} \
	-Dsecor.s3.bucket=${S3_BUCKET} \
	-Dsecor.kafka.topic_filter=${TOPIC_FILTER} \
	-Dsecor.message.parser.class=${MESSAGE_PARSER_CLASS} \
	-Dmessage.timestamp.name=${TS_NAME} \
	-Dsecor.local.path=${LOCAL_PATH} \
	-Dlog4j.configuration=log4j.prod.properties \
	-Dconfig=secor.prod.backup.properties \
	-cp secor-0.1-SNAPSHOT.jar:lib/* \
	com.pinterest.secor.main.ConsumerMain
fi

exec "$@"

