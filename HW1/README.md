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
localectl 
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
()
Ubuntu  
()

# Вывести список модулей ядра и записать в файл
```bash
lsmod > ~/modules.txt
```
Проверка файла с помощью cat:  

Almalinux
()  
Ubuntu
()
# Просмотреть информацию о процессоре и модулях оперативной памяти
Процессор:
```bash
lscpu
```
Almalinux    
()  
Ubuntu    
()  
модули:

```bash
sudo dmidecode 
```
Almalinux      
()  
Ubuntu     
()  

# Получить информацию о жестком диске
```bash
lshw -short -C disk
```
Almalinux      
()  
Ubuntu     
()  

# Добавить в виртуальную машину второй сетевой интерфейс (вывести информацию о нем в виртуалках)
Almalinux  

Ubuntu
# Узнать полную информацию об использованной и неиспользованной оперативной памяти
# Создать пользователя new_admin_user, Настроить ssh доступ пользователю по ключу на VM, запретить ему авторизацию по паролю
# Вывести список файловых систем, которые поддерживаются ядром
