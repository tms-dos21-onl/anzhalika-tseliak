Склонировать текущий репозиторий <FIRSTNAME>-<LASTNAME> (например, ivan-ivanov) на локальную машину.
-

- Создание ssh ключа:

```bash
ssh-keygen
```
 
 - Добавление ключа на GitHub:

    - Settings  
    - SSH and GPG keys  
    - New SSH key

- Задать имя и адрес электронной почты (во избежание ошибок нужно указать как в GitHub):

```bash
git config user.name "anzhalikatseliak"  

git config user.email "anzhalikatseliak@gmail.com"
```

- Клонирование своего репозитория на локальную машину:

```bash
git clone git@github.com:tms-dos21-onl/anzhalika-tseliak.git
```

Вывести список всех удаленных репозиториев для локального.
-

```bash
git remote -v
```
![](/HW8/assets/2-1.png) 

Вывести список всех веток.
-
```bash
git branch -a 

# или

git branch —all 
```
![](/HW8/assets/3-1.png) 

Вывести последние 3 коммитa с помощью git log.
-
```bash
git log -3

# или

git log -n 3
```
![](/HW8/assets/4-1.png) 

Создать пустой файл README.md и сделать коммит.
-
```bash
touch README.md

git add README.md 

git commit -m ‘create README.md’
```
![](/HW8/assets/5-1.png)

Добавить фразу "Hello, DevOps" в README.md файл и сделать коммит.
-
```bash
echo "Hello, DevOps" >> README.md

git add README.md

git commit -m 'modify README with Hello DevOps'
```
![](/HW8/assets/6-1.png) 

Сделать реверт последнего коммита. Вывести последние 3 коммитa с помощью git log.
-

```bash
git revert HEAD 

#или 

git revert <id коммита>
```
![](/HW8/assets/7-1.png) 

Удалить последние 3 коммита с помощью git reset.
-

```bash
git reset --hard HEAD~3 # --hard удаляет изменения, если сделать --soft то файлы будут в состоянии как в последнем коммите (позволяет объединять коммиты в один)
```
![](/HW8/assets/8-1.png) 

Вернуть коммит, где добавляется пустой файл README.md. Для этого найти ID коммита в git reflog, а затем сделать cherry-pick.
-

```bash
git cherry-pick f4a0ebc
```
![](/HW8/assets/9-1.png) 

Удалить последний коммит с помощью git reset.
-

```bash
git reset --hard HEAD
```
![](/HW8/assets/10-1.png) 

Переключиться на ветку main или master. Если ветка называется master, то переименовать её в main.
-

>git branch -m newname -переименовать текущую ветку

>git branch -m name newname -переименовать любую ветку

Скопировать файл https://github.com/tms-dos21-onl/_sandbox/blob/main/.github/workflows/validate-shell.yaml, положить его по такому же относительному пути в репозиторий. Создать коммит и запушить его в удаленный репозиторий.
-

Клонирование репозитория с файлом:


```bash
git clone git@github.com:tms-dos21-onl/_sandbox.git
```

Создание директорий:

```bash
mkdir -p anzhalika-tseliak/.github/workflows
```
Копирование файла:

```bash
cp _sandbox/.github/workflows/validate-shell.yaml anzhalika-tseliak/.github/workflows/validate-shell.yaml
```

![](/HW8/assets/12-1.png) 

Коммит и push:

```bash
git add .github/workflows/validate-shell.yaml

git commit -m 'add validate-shell'

git push
```
![](/HW8/assets/12-2.png) 

validate-shell результат:

![](/HW8/assets/12-3.png) 

Создать из ветки main ветку develop. Переключиться на неё и создать README.md в корне репозитория. Написать в этом файле какие инструменты DevOps вам знакомы и с какими вы бы хотели познакомиться больше всего (2-3 пункта). Сделать коммит.
-
Создание ветки и переход в нее:
```bash
git checkout -b develop main
```

Создание файла и добавление текста:

```bash
touch README. md

cat <<EOF >> README. md
# Инструменты с которыми я знакома:
- bash
- systemd
- git
- nmap
# Инструменты с которыми я хотела бы познакомиться:
- ansible
- python
- docker
- kubernetes
EOF
```

Коммит:

```bash
git add README.md

git commit -m 'add README'
```
![](/HW8/assets/13-1.png) 

Создать из ветки main ветку support и создать там файл LICENSE в корне репозитория с содержимым https://www.apache.org/licenses/LICENSE-2.0.txt. Сделать коммит. Вывести последние 3 коммитa.
-

Создание ветки и переход в нее:

```bash
git checkout -b support main
```

Создание файла:

```bash
curl https://www.apache.org/licenses/LICENSE-2.0.txt > LICENSE
```

Коммит:

```bash
git add LICENSE

git commit -m 'add LICENSE'
```

Вывод коммитов:

```bash
git log -n 3
```
![](/HW8/assets/14-1.png) 

Переключиться обратно на ветку main и создать там файл LICENSE в корне репозитория с содержимым https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt. Сделать коммит. Вывести последние 3 коммитa.
-

Переключится на ветку:

```bash
git checkout main
```

Создание файла:

```bash
curl https://raw.githubusercontent.com/git/git-scm.com/main/MIT-LICENSE.txt > LICENSE
```

Коммит:

```bash
git add LICENSE

git commit -m 'add LICENSE'
```

Вывод коммитов:

```bash
git log -n 3
```
![](/HW8/assets/15-1.png) 

Сделать merge ветки support в ветку main и решить конфликты путем выбора содержимого любой одной лицензии.
-

Мерж из ветки main:

```bash
git merge support 
```
![](/HW8/assets/16-1.png) 

Решение конфликта:

```bash
code LICENSE #открыть файл, выбрать содерживое.
```
![](/HW8/assets/16-2.png) 

Коммит:

```bash
git add LICENSE

git commit -m 'add LICENSE'
```
![](/HW8/assets/16-3.png) 

Переключиться на ветку develop и сделать rebase относительно ветки main.
-

```bash
git checkout develop

git rebase main
```
![](/HW8/assets/17-1.png) 

Вывести историю последних 10 коммитов в виде графа с помощью команды git log -10 --oneline --graph.
-

![](/HW8/assets/18-1.png) 


 Запушить ветку develop. В истории коммитов должен быть мерж support -> main.
 -

```bash
git push --set-upstream origin develop
```
![](/HW8/assets/19-1.png) 
![](/HW8/assets/19-2.png) 
![](/HW8/assets/19-3.png) 

 Зайти в свой репозиторий на GitHub и создать Pull Request из ветки develop в ветку main.
 -
![](/HW8/assets/20-1.png) 
![](/HW8/assets/20-2.png) 