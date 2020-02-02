#!/bin/bash

pid=""
uid=""
gid=""

bin_name=$1

function get_pid() {
    pid=$(pgrep -n ${bin_name})
}

function get_uid() {
    uid=$(cat /proc/$pid/status | grep -E 'Uid')
}

function get_gid() {
    gid=$(cat /proc/$pid/status | grep -E 'Gid')
}

function main() {
    echo $bin_name

    get_pid ${bin_name}
    get_uid
    get_gid

    echo $pid
    echo $uid
    echo $gid
}

main
