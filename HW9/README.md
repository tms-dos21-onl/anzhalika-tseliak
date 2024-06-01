Вывести в консоль список всех пользователей системы.
-

``` bash
cat /etc/passwd
```
![](/HW9/assets/1-1.png)

Найти и вывести в консоль домашние каталоги для текущего пользователя и root.

``` bash
echo ~ #текущий юзер 

echo ~root #любой юзер
```
![](/HW9/assets/2-1.png)

Создать Bash скрипт get-date.sh, выводящий текущую дату.
-

[get-date.sh](/HW9/get-date.sh) 

Запустить скрипт через ./get-date.sh и bash get-date.sh. Какой вариант не работает? Сделать так, чтобы оба варианта работали.
-
Не работает ./get-date.sh.   
Нужно сделать файл исполняемым:

``` bash
chmod u+x

#или

chmod 774
```
![](/HW9/assets/4-1.png)

Создать пользователей alice и bob с домашними директориями и установить /bin/bash в качестве командной оболочки по умолчанию.
-

``` bash
sudo adduser bob

sudo chsh -s /bin/bash bob

sudo adduser alice

sudo chsh -s /bin/bash alice

```
![](/HW9/assets/5-1.png)

Запустить интерактивную сессию от пользователя alice. Создать файл secret.txt с каким-нибудь секретом в домашней директории при помощи текстового редактора nano.
-

``` bash
su alice 

nano secret.txt
```
![](/HW9/assets/6-1.png)

Вывести права доступа к файлу secret.txt.
-

``` bash
ls -la secret.txt
```
![](/HW9/assets/7-1.png)

Выйти из сессии от alice и открыть сессию от bob. Вывести содержимое файла /home/alice/secret.txt созданного ранее не прибегая к команде sudo. В случае, если это не работает, объяснить.
-

>bob не владелец файла и не входит в группу

![](/HW9/assets/8-1.png)

Создать файл secret.txt с каким-нибудь секретом в каталоге /tmp при помощи текстового редактора nano.
-

``` bash
nano secret.txt
```
![](/HW9/assets/9-1.png)

Вывести права доступа к файлу secret.txt. Поменять права таким образом, чтобы этот файл могли читать только владелец и члены группы, привязанной к файлу.
-

``` bash
ls -la secret.txt

chmod o-r secret.txt
```

![](/HW9/assets/10-1.png)

Выйти из сессии от bob и открыть сессию от alice. Вывести содержимое файла /tmp/secret.txt созданного ранее не прибегая к команде sudo. В случае, если это не работает, объяснить.
-
>alice - в категории others (chmod),нет прав на чтение

![](/HW9/assets/11-1.png)

Добавить пользователя alice в группу, привязанную к файлу /tmp/secret.txt.
-

``` bash
sudo usermod -aG bob alice
```
![](/HW9/assets/12-1.png)


Вывести содержимое файла /tmp/secret.txt.
-

![](/HW9/assets/13-1.png)

Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice с помощью rsync.
-

``` bash
rsync -av /home/alice/ /tmp/alice 
```

![](/HW9/assets/14-1.png)

Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice на другую VM по SSH с помощью rsync. Как альтернатива, можно скопировать любую папку с хоста на VM по SSH (scp).
-
``` bash
rsync -avze ssh /home/alice/ anzhalika@192.168.100.65:/tmp/alice
```
![](/HW9/assets/15-1.png)

![](/HW9/assets/15-2.png)

Удалить пользователей alice и bob вместе с домашними директориями.
-
``` bash
sudo userdel -r bob

sudo userdel -r alice
```
![](/HW9/assets/16-1.png)

С помощью утилиты htop определить какой процесс потребляет больше всего ресурсов в системе.
-
>сортировка: F6

![](/HW9/assets/17-1.png)
![](/HW9/assets/17-2.png)

Вывести логи сервиса Firewall с помощью journalctl не прибегая к фильтрации с помощью grep.
-

``` bash
journalctl -u ufw.service
```
![](/HW9/assets/18-1.png)
