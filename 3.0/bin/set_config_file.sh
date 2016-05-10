#!/bin/bash

source /tmp/bin/env

case ${MEMORY_SIZE:-micro} in
    "micro")
       export CFG_MAXMEMORY="96mb"
       echo "Optimizing Redis for 128M Memory...."
       ;;
    "small")
       export CFG_MAXMEMORY="192mb"
       echo "Optimizing Redis for 256M Memory...."
       ;;
    "medium")
       export CFG_MAXMEMORY="384mb"
       echo "Optimizing Redis for 512M Memory...."
       ;;
    "large")
       export CFG_MAXMEMORY="750mb"
       echo "Optimizing Redis for 1G Memory...."
       ;;
    "2xlarge")
       export CFG_MAXMEMORY="1.5G"
       echo "Optimizing Redis for 2G Memory...."
       ;;
    "4xlarge")
       export CFG_MAXMEMORY="3G"
       echo "Optimizing Redis for 4G Memory...."
       ;;
    "8xlarge")
       export CFG_MAXMEMORY="6G"
       echo "Optimizing Redis for 8G Memory...."
       ;;
    16xlarge|32xlarge|64xlarge)
       export CFG_MAXMEMORY="12G"
       echo "Optimizing Redis for 18G+ Memory...."
       ;;
    *)
       export CFG_MAXMEMORY="96mb"
       echo "Optimizing Redis for 128M Memory...."
       ;;
esac

function set_config() {
    CFG=($(env | sed -nr "s/CFG_([0-9A-Z_a-z-]*)/\1/p"|tr A-Z a-z))

    for CFG_KEY in "${CFG[@]}"; do
        KEY=`echo $CFG_KEY | cut -d = -f 1`
        VAR=`echo $CFG_KEY | cut -d = -f 2`
        if [ "$VAR" == "" ]; then
            echo "Empty volue for option \"$KEY\"."
            continue
        fi
        grep -q "$KEY" $CONFIG_FILE
        if (($? > 0)); then
            echo "${KEY}${DELIMITER}${VAR}" >> $CONFIG_FILE
            echo "Config add option for \"$KEY\"."
        else
            sed -i -r "s~#?($KEY)[ ]*${DELIMITER}.*~\1 ${DELIMITER} $VAR~g" $CONFIG_FILE  >/dev/null 2>&1
            echo "Option found for \"$KEY\"."
        fi
    done
}

set_config
