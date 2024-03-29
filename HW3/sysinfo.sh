#!/bin/bash 

ram=$(free --mega | grep ‘Mem:’ | awk ‘{print $4}’)
#ram -переменная со следующим значением:
#free –утилита, позволяющая отображать информацию о использовании оперативной памяти
#--mega -вывод в мегабайтах
#grep 'Mem:' -выбрать только строку включающую в себя'Mem:'
#awk '{print $4}' -выбрать только четвертую позицию(позиции разделяются пробелами)

echo “Количество ОЗУ:${ram}MB”
#вывод переменной ram и дополнительного текста




cpuidle=$(mpstat | grep all | awk ‘{print $12)’ | sed ’s/,/./‘)
#cpuidle -переменная со следующим значением:
#mpstat -утилита выводящая отчет о использовании процессора
#grep all -выбрать только строку включающую в себя all
#awk '{print $12}' -выбрать только двенадцатую позицию с значением idle(показатель простаивания процессора в процентах)
#sed 's/,/./' -замена символа(s обозначает операцию замены, а прямые слэши выступают разделителями)

cpuload=$(echo 100 - $cpuidle | bc)
#cpuload --переменная со следующим значением:
#echo 100 -$cpuidle -передача утилите echo вычитания от ста значения переменной $cpuidle(простоя) 
#bc -позволяет пользователям выполнять математические операции

echo “Загрузка процессора:${cpuload}”
#вывод переменной сpuload и дополнительного текста


ipadress=$(ip addr | grep global | awk ‘{print $2}’)
#ipadress -переменная со следующим значением:
#ip addr -доступные ip адреса
#grep global -выбрать только строку включающую в себя global
#awk ‘{print $2}’ -выбрать только вторую позицию с ip адресом
echo “IP адрес: ${ipadress}”
#вывод переменной ipadress и дополнительного текста
