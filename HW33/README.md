Создать Firewall правило DenyAll с низким приоритетом, которое блокирует трафик из любой сети в любую сеть на любом порту. Включить логирование для этого правила.
-
>VPC network -> Firewall -> +CREATE FIREWALL RULE

Cозданное правило с приоритетом 65535:
![](./assets/1-1.png)

Зайти в Logs Storage и активировать опцию Log Analytics для _Default Log bucket.
-
![](./assets/2-1.png)
![](./assets/2-2.png)

Создать 2 VM в одной сети, но разных подсетях.
-
>При использовании сети default, все подсети будут называться default:

![](./assets/3-1.png)
![](./assets/3-2.png)
![](./assets/3-3.png)
![](./assets/3-4.png)

Выполнить ping одной VM из другой. В случае, если ping не работает, посмотреть логи. Сделать так, чтобы ping работал 😊
-
![](./assets/4-1.png)

Создать новую сеть и подсеть в том регионе, где была создана одна из VM, и перенести эту VM в созданную подсеть новой сети. Иными словами, поменять/добавить этой VM сетевой интерфейс.
-
>VPC network -> VPC networks -> +CREATE VPC NETWORK

Созданная сеть:
![](./assets/5-1.png)
Изменение интерфейса vm-2:
![](./assets/5-2.png)


Выполнить ping этой VM из ранее созданной. В случае, если ping не работает, посмотреть логи.
-
  
>Несмотря на то, что ping работает(ICMP протокол), в логах отслеживаются только TCP и UDP.

Проверка работы ping c помощью Connectivity Test:

- ping

![](./assets/6-1.png) 

- Connectivity Test

>Connectivity Tests -> +CREATE CONNECTIVITY TEST

![](./assets/6-2.png) 

Тест подсказываетет, что необходимо разрежающее firewall правило:

![](./assets/6-3.png) 

- Создание firewall правила для icmp

>VPC network -> Firewall -> +CREATE FIREWALL RULE

![](./assets/6-4.png) 

- RERUN теста

![](./assets/6-5.png) 

- Работающий ping 

![](./assets/6-6.png) 


Настроить пиринг между сетями. Снова попробовать пинг, снова посмотреть логи. Сделать так, чтобы ping работал.
-

>VPC network peering -> +CREATE PEERING CONNECTION

- custom-default
![](./assets/7-1.png) 
![](./assets/7-2.png) 

- default-custom
![](./assets/7-3.png) 
![](./assets/7-4.png) 

- ping и тесты

>ping работает при наличии ранее созданного icmp правила,как показывает тест

![](./assets/7-5.png) 
![](./assets/7-6.png) 

>если правило удалить, ping перестанет работать

![](./assets/7-7.png) 
![](./assets/7-8.png) 


Найти пример приложения для App Engine Standard Environment и установить его.
-

>App Engine -> CREATE APPLICATION  
Select a region *  ->  us-central1 #в дальнейшем изменить будет нельзя  
Resources -> Java

![](./assets/8-1.png) 

Клонирование репозитория с примером и deploy:
```bash
git clone https://github.com/GoogleCloudPlatform/java-docs-samples.git

cd java-docs-samples/appengine-java11/springboot-helloworld/ 

gcloud app deploy 
```
![](./assets/8-2.png) 
Результат:
```bash
gcloud app browse
```
![](./assets/8-3.png) 
