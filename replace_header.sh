#!/bin/bash
SOURCE_DIR=`dirname $0`

echo $0
echo $1

if [ $# != 1 ]; then
    echo "Usage: replace_header.sh <file>"
    exit 1
fi

for OUTPUT in $(find $1 -iname "*.swift") 
do
    cat $SOURCE_DIR/header.template > $SOURCE_DIR/tmp
    echo '' >> $SOURCE_DIR/tmp
    cat $OUTPUT | awk -f $SOURCE_DIR/remove_header.awk >> $SOURCE_DIR/tmp
    mv $SOURCE_DIR/tmp $OUTPUT
done 

