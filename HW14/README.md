Скопировать папку https://github.com/tms-dos21-onl/_sandbox/tree/main/lecture15/api на VM и запустить Python REST Api приложение согласно инструкции. Проверить работоспособность всех доступных REST Api методов с помощью Swagger.
-
Копирование папки:

``` bash
git clone git@github.com:tms-dos21-onl/_sandbox.git

cp -r sandbox/lecture15/api api
```

Запуск Python REST Api:

``` bash
sudo apt-get update

sudo apt-get install python3-pip

pip install -r requirements.txt

python main.py 5000
```
Проверка:

![](/HW14/assets/1-1.png) 
![](/HW14/assets/1-2.png) 
![](/HW14/assets/1-3.png) 
![](/HW14/assets/1-4.png) 
![](/HW14/assets/1-5.png) 
![](/HW14/assets/1-6.png) 

Установить Nginx на VM и настроить его как Reverse Proxy для Python REST Api приложения из предыдущего пункта.
-
Установка:

``` bash
sudo apt install nginx -y
```
Настройка:

``` bash
sudo nano /etc/nginx/conf.d

    server {
    listen 8080; #порт 80 уже занят сервером по умолчанию
    root /var/www/;
    server_name http://localhost;
    
    location / {
    proxy_pass http://localhost:5000;
    }
}


sudo systemctl restart nginx  
```
![](/HW14/assets/2-1.png) 
> nginx -t выдает предупреждение: 
> 
 >nginx: [warn] server name "http://localhost" has suspicious symbols in /etc/nginx/conf.d/my.conf:4  
>
>Причина этому мне не понятна,но все работает.

![](/HW14/assets/2-2.png) 
![](/HW14/assets/2-3.png) 
![](/HW14/assets/2-4.png) 

Проверка:

``` bash
sudo systemctl stop nginx
```
![](/HW14/assets/2-5.png) 

Установить JMeter и написать тестовый сценарий для проверки производительности приложения путем выполнения HTTP GET запроса http://<NGINX_IP>:<NGINX_PORT>/ping от 100 пользователей.
-

``` bash
sudo apt update
sudo apt upgrade

sudo apt install openjdk-11-jdk
java -version

wget https://downloads.apache.org/jmeter/binaries/apache-jmeter-5.6.2.tgz
tar -xvzf apache-jmeter-5.6.2.tgz
``` 
![](/HW14/assets/3-1.png) 
![](/HW14/assets/3-2.png) 

``` bash
./jmeter.sh
``` 
>NGINX_test  ->  Threads(Users)  -> Thread Group  
>Thread Group  ->  Sampler  ->  HTTP Request  
>NGINX_test  ->  Listener  ->  View Results Tree  
>NGINX_test  ->  Listener  ->  Graph Results

![](/HW14/assets/3-3.png)
![](/HW14/assets/3-4.png)
![](/HW14/assets/3-5.png)
![](/HW14/assets/3-6.png)


Результат с добавлением ста пользователей:

![](/HW14/assets/3-7.png)
![](/HW14/assets/3-8.png)

Результат с добавлением тысячи пользователей:

![](/HW14/assets/3-9.png)
![](/HW14/assets/3-10.png)


Запустить ещё один экземпляр Python REST Api приложения на другом порту.
-

``` bash
python main.py 3000
``` 
![](/HW14/assets/4-1.png)

Изменить конфигурацию Nginx, чтобы он использовал в качестве бэкенда 2 приложения.
-

``` bash
server (
   listen 8080;
   root /var/www/;
   server_name http://localhost;
   location / {
   proxy_pass http://localhost:5000;
    
    }
}

server {
   listen 8080;
   root /var/www/;
   server_name http://localhost;
   location / {
   proxy_pass http://localhost:3000;

   }
}
```

Повторить JMeter сценарий и сравнить результаты.
-

``` bash
./jmeter.sh
``` 
Результат новой конфигурации с добавлением ста пользователей:

![](/HW14/assets/6-1.png)
![](/HW14/assets/6-2.png)

Результат новой конфигурации с добавлением тысячи пользователей:

![](/HW14/assets/6-3.png)
![](/HW14/assets/6-4.png)

