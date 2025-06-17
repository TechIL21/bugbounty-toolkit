#!/bin/bash

# ======= Настройки ========
OUTPUT_DIR="output"
TARGET="$1"
WORDLIST="$OUTPUT_DIR/${TARGET}_subdomains.txt"

# ======= Проверка аргумента ========
if [[ -z "$TARGET" ]]; then
    echo "[!] Использование: $0 <domain.com>"
    exit 1
fi

# ======= Проверка зависимостей ========
for tool in subfinder assetfinder amass; do
    if ! command -v "$tool" &>/dev/null; then
        echo "[!] Не найдено: $tool. Установите его и повторите."
        exit 1
    fi
done

# ======= Создание директории вывода ========
mkdir -p "$OUTPUT_DIR"

# ======= Сканирование ========
echo "[*] Сканируем домен: $TARGET"
echo "[*] Используем subfinder..."
subfinder -d "$TARGET" -silent

echo "[*] Используем assetfinder..."
assetfinder --subs-only "$TARGET"

echo "[*] Используем amass..."
amass enum -passive -d "$TARGET"

# ======= Объединение, сортировка, фильтрация ========
echo "[*] Объединяем результаты..."
{
    subfinder -d "$TARGET" -silent
    assetfinder --subs-only "$TARGET"
    amass enum -passive -d "$TARGET"
} | sort -u > "$WORDLIST"

echo "[+] Готово! Сохранено в: $WORDLIST"

