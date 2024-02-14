> Я выбрала AlmaLinux вместо CentOS потому что:
> - AlmaLinux является приближенным к RedHat Enterprise Linux дистрибутивом
> - AlmaLinux продолжает поддерживаться
> - AlmaLinux начиная с 9 версии поддерживает работу на процессоре Apple 
# Произвести минимальную настройку (время, локаль, custom motd)
## motd:
Добавить сообщение в файл:
```bash
echo 'Hello MOTD' > /etc/motd
```
AlmaLinux:
![](/HW1/assets/1-2.png)  
Ubuntu:
![](/HW1/assets/1-1.png)    
На Ubuntu используется не только /etc/motd, поэтому сообщение длинное.   
[Подробнее](https://habr.com/ru/articles/529746/)
## locale:
```bash
locale 
```
(чтобы посмотреть список доступных локалей добавляем флаг -a)  
Зaменить значение для LANG на нужный нам локаль:
```bash
sudo localectl set-locale LANG=en_IN.UTF-8
```
или

```bash
sudo dpkg-reconfigure locales #для Ubuntu,не работает на AlmaLinux
```  
Almalinux:    
![](/HW1/assets/1-9.png)   
 
Ubuntu:  
![](/HW1/assets/1-3.png)  
![](/HW1/assets/1-4.png)  
![](/HW1/assets/1-5.png)  
## время:
Изменение времени:
```bash
sudo date -s "00:50:00"
```
![](/HW1/assets/1-7.png)   
после этой команды, системное время возвращается к предыдущему значению. Поэтому нужно настроить аппаратные часы:
```bash
hwclock --set --date="2024-02-14 22:22:22"
```
![](/HW1/assets/1-6.png)  
Изменение таймзоны:
Просмотр доступных временных зон:
```bash
timedatectl list-timezones
```
Изменение:
```bash
sudo timedatectl set-timezone Europe/Paris
```
![](/HW1/assets/1-8.png)  
# Определить точную версию ядра.
```bash
uname -r
```
AlmaLinux  
![](/HW1/assets/2-1.png)   
Ubuntu    
![](/HW1/assets/2-2.png) 
# Вывести список модулей ядра и записать в файл
```bash
lsmod > ~/modules.txt
```
Проверка файла с помощью cat:  
Almalinux
![](/HW1/assets/3-1.png)   
Ubuntu
![](/HW1/assets/3-2.png) 
# Просмотреть информацию о процессоре и модулях оперативной памяти
Процессор:
```bash
lscpu
```
Almalinux    
![](/HW1/assets/4-1.png)   
Ubuntu    
![](/HW1/assets/4-2.png)  
модули:
```bash
sudo dmidecode --type memory | less  #less позволяет перемещаться вверх и вниз по выводу команды
```
Вывод команды:
Almalinux
![](/HW1/assets/6-1.png)  
Ubuntu     
![](/HW1/assets/6-2.png) 
# Получить информацию о жестком диске
```bash
lshw -short -C disk
```
Almalinux
![](/HW1/assets/5-1.png)  
Ubuntu     
![](/HW1/assets/5-2.png) 
# Добавить в виртуальную машину второй сетевой интерфейс (вывести информацию о нем в виртуалках)
1. Settings
2. Add device
3. Network adapter
Увидеть доступные сетевые интерфейсы:
```bash
ip a
```
Ubuntu  
![](/HW1/assets/7-1.png) 
![](/HW1/assets/7-2.png) 
![](/HW1/assets/7-3.png) 
![](/HW1/assets/7-4.png) 
Almalinux  
![](/HW1/assets/7-5.png) 
![](/HW1/assets/7-8.png) 
Ubuntu
# Узнать полную информацию об использованной и неиспользованной оперативной памяти
```bash
free
```
Almalinux  
![](/HW1/assets/8-1.png)  
Ubuntu  
![](/HW1/assets/8-2.png) 
# Создать пользователя new_admin_user, Настроить ssh доступ пользователю по ключу на VM, запретить ему авторизацию по паролю
> В качестве сервера используется Almalinux,а в качестве клиента - Ubuntu
1. 
Создание юзера на сервере
``` bash
sudo adduser new_admin_user
```
2.Установка ssh на сервер
``` bash
sudo dnf install openssh-server
```
3.Проверка статуса демона:
```bash
sudo systemctl status sshd
```
4.Установка ssh на клиент
```bash
sudo apt-get install openssh-server
```
5.Проверка статуса ssh
``` bash
sudo systemctl status sshd
```
6.Генерирование ключей:
``` bash
sudo ssh-keygen
```
7.Копирование публичного ключа на сервер:
```
ssh-copy-id new_admin_user@172.16.197.149
```
8.Отключение входа по паролю для new_admin_user с помощью записи в конфигурационном файле на сервере:

``` bash
sudo nano /etc/ssh/sshd_config
```
Записать:
```
Match User new_admin_user
 PasswordAuthentication no
```
9.Перезапуск службы 
``` bash
sudo service sshd restart
```
> Во время записи в файл запрета лишний пробел может остановить работу sshd и выдать ошибку при его рестарте,если это происходит можно воспользоваться командой sudo ssh -t и увидеть где конкретно допущена ошибка

установка ssh (сервер и клиент)
![](/HW1/assets/8-1.1.png) 
![](/HW1/assets/8-2.2.png) 
создание ключей,перебрасывание публичного ключа на сервер и проверка(клиент)
![](/HW1/assets/8-3.png) 
прописывание запрета и рестарт демона
![](/HW1/assets/8-4.png) 
# Вывести список файловых систем, которые поддерживаются ядром
```bash
cat /proc/filesystems
```
Almalinux  
![](/HW1/assets/9-1.png) 
Ubuntu  
![](/HW1/assets/9-2.png) 
