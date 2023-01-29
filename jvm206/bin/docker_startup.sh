#!/bin/bash

start_containers() {

    local containers=("$@")

    for container in "${containers[@]}"; do

       running=$(check_container_state "$container")

        if [ "$running" != 0 ]; then

            echo "Starting $container"

            docker start $container

        else

            echo "$container is already running"

        fi

    done

}

exec_container_command() {

    local container="$1"

    local command="$2"

    docker exec -it -d $container $command

}

check_container_state() {

    local name="$1"

    local status=$(docker inspect --format '{{ .State.Running }}' $name 2>/dev/null)

    if [ "$status" == "true" ]; then

        echo "0"

    else

        echo "1"

    fi

}

containers_array=("portainer" "mediawiki" "nginx")

start_containers "${containers_array[@]}"

exec_container_command "mediawiki" "service mariadb start"