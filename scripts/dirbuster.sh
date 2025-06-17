#!/bin/bash

# Скрипт для перебора директорий на веб-сервере
# Использует ffuf — https://github.com/ffuf/ffuf

if [[ $# -ne 2 ]]; then
    echo "Использование: $0 <URL> <словарь>"
    echo "Пример: $0 http://target.com /usr/share/wordlists/dirb/common.txt"
    exit 1
fi

URL=$1
WORDLIST=$2
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
OUTDIR="results"
OUTFILE="$OUTDIR/dirbuster_${DATE}.txt"

mkdir -p "$OUTDIR"

echo "[*] Запуск ffuf на $URL с словарём $WORDLIST..."
ffuf -u "$URL/FUZZ" -w "$WORDLIST" -o "$OUTFILE" -of md -t 50

echo "[+] Результат сохранён в $OUTFILE"

