#!/bin/bash

DOMAIN="example.ru"
FLAG="FLAG="

subfinder -d $DOMAIN | while read subdomain; do
    # Получаем TXT-запись для поддомена
    txt_record=$(host -t txt $subdomain | cut -d " " -f 4-)

    # Проверяем наличие строки, содержащей значение переменной FLAG
    if [[ $txt_record == *$FLAG* ]]; then
        echo "В поддомене $subdomain найдена строка, начинающаяся с $FLAG:"
        echo $txt_record
    fi
done
