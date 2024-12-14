#!/bin/bash

FILE=""
SEARCH=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --file)
            FILE=$2
            shift
            shift
            ;;
        --search)
            SEARCH=$2
            shift
            shift
            ;;
        *)
            echo "Error: argument $1 not supported"
            exit 1
            ;;
    esac
done

# Check if file exists
if [[ ! -f "$FILE" ]]; then
    echo "Error: File $FILE does not exist."
    exit 1
fi

count=$(grep -c "$SEARCH" "$FILE")

if [[ $count -gt 0 ]]; then
    echo "Найдено совпадений: $count"
else
    echo "Не найдено не одного совпадения в файле $(realpath "$FILE")"
fi
