#! /bin/bash

IMAGE_NAME=malia_test_image

cleanup() {
	docker stop $CONTAINER
	docker rm $CONTAINER
}

TEST_NAME=$1
CONTAINER=$(docker create --shm-size 1G -i -v $(pwd):/malia --name malia_test_$(date +'%H%M%S') ${IMAGE_NAME})
echo using container $CONTAINER
docker start $CONTAINER
docker exec -i $CONTAINER bash -c "echo innodb_flush_log_at_trx_commit=2  >> /etc/mysql/mysql.conf.d/mysqld.cnf"
docker exec -i $CONTAINER bash -c "mv /var/lib/mysql /dev/shm/mysql"
docker exec -i $CONTAINER bash -c "mkdir /dev/shm/tmp"
docker exec -i $CONTAINER bash -c "chown -R mysql:mysql /dev/shm/tmp"
docker exec -i $CONTAINER bash -c "echo datadir=/dev/shm/mysql >> /etc/mysql/mysql.conf.d/mysqld.cnf"
docker exec -i $CONTAINER bash -c "echo tmpdir=/dev/shm/tmp >> /etc/mysql/mysql.conf.d/mysqld.cnf"
docker exec -i $CONTAINER bash -c "service mysql start"
docker exec -i $CONTAINER bash -c "cd malia && ./run_tests.sh -k ${TEST_NAME} --durations=100 --cov-report term-missing --cov=./ --cov-config .coveragerc --cov-report=xml --junitxml=./results.xml"
cleanup

