Выполнение с помощью VMware Fusion на Ubuntu

Отобразить все процессы в системе.
-
``` bash
ps -ef  #-e  -отображение всех процессов; -f  -полное форматирование списка
```
![](/HW4/assets/1-1.png) 

Запустить бесконечный процесс в фоновом режиме используя nohup.
-
Создание файла и запись в него цикла, выводящего "Hello World!" посекундно и время выполнения:

[helloworld.sh](/HW4/helloworld.sh) 

Запуск процесса:

``` bash
nohup ./helloworld.sh &
```

Проверка:

``` bash
tail -f nohup.out  #-f -выводить поступающие данные по мере роста файла
```
![](/HW4/assets/2-1.png) 

Убедиться, что процесс продолжил работу после завершения сессии.
-

Проверка работы процесса после смены пользователя:

``` bash
tail -f nohup.out 
```
![](/HW4/assets/3-1.png) 

Убить процесс, запущенный в фоновом режиме.
-

Убить процесс с помощью kill и провериить его с помощью цикла:

``` bash
if kill -0 75830; then echo "alive"; fi
```
![](/HW4/assets/4-1.png) 


Написать свой сервис под управлением systemd, добавить его в автозагрузку (можно использовать процесс из п.2).
-

Написание скрипта выводящего по секундам текст и время исполнения:

[blabla.sh](/HW4/blabla.sh) 

Оборачивание скрипта в сервис:

``` bash
nano /etc/systemd/system/blabla.service    #расширение сервис обязательно
```

Запись:

``` bash
[Unit]  
Description=Message service   #Описание юнита

[Service]
ExecStart=/bin/bash /home/user/blabla.sh  #Выполняемая команда
Restart=always  #Атоматически рестартовать сервис, если он вдруг перестанет работать

[Install]
WantedBy=multiuser.target  #Уровень запуска, многопользовательский режим
```

Помочь systemd увидеть  новый сервис с помощью команды:

``` bash
systemctl daemon-reload
```

Запуск сервиса:

``` bash
systemctl start blabla
```
Проверка сервиса:

``` bash
systemctl status blabla
```
![](/HW4/assets/5-1.png) 

Посмотреть логи своего сервиса.
-

Просмотр в syslog:

``` bash
cat /var/log/syslog | grep blablabla
```
![](/HW4/assets/6-1.png) 

Отслеживание логов в реальном времени:

``` bash
journalctl -f -u blabla  #-f -аналог tail,отслеживание в реальном времени; -u -фильтрация
```
![](/HW4/assets/6-2.png) 

Написать скрипт, который выводит следующую информацию (можно переиспользовать предыдущее дз):
-
>кол-во процессов запущенных из под текущего пользователя
>
>load average за 15 минут
>
>кол-во свободной памяти
>
>свободное место в рутовом разделе /
>

Скрипт:

[sysinfo2.sh](/HW4/sysinfo2.sh) 

Вывод скрипта:

![](/HW4/assets/7-1.png) 


Добавить в cron задачу, которая будет каждые 10 минут писать в файл результаты выполнения скрипта из п.7
-

Добавление задачи в chrontab файл:

``` bash
chrontab -e  
```

Добавление  строки:

``` bash
*/10 * * * * bash sysinfo2.sh >> /home/user/results  
```
![](/HW4/assets/8-1.png) 

Просмотр файла c результатами скрипта:

``` bash
cat results
```
![](/HW4/assets/8-2.png) 

Сделать п. 5 для Prometheus Node Exporter
-

node exporter для arm64:

``` bash
curl -L https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-arm64.tar.gz --output node_exporter.tar.gz  #-L -позволяет curl отправить запрос в новое место, если она встречает перенаправление
```

Разархивирование:

``` bash
tar -xf node_exporter.tar.gz
```

Проверка работы node exporter:

``` bash
./node_exporter
```

![](/HW4/assets/9-1.png) 

Создание сервис файла:

``` bash
sudo nano node_exporter.service
```

``` bash
[Unit]
Description=Node Exporter
[Service]
User=user2
WorkingDirectory=/home/user2/ ExecStart=/home/user2/node_exporter
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
``` 

Перезагрузка демона:

``` bash
systemctl daemon-reload
``` 

Запуск сервиса:

``` bash
systemctl start node_exporter
```

Проверка сервиса:

``` bash
systemctl status node_exporter
```
![](/HW4/assets/9-2.png) 


![](/HW4/assets/9-3.png) 



