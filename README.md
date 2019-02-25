## nickRiNi_infra


nickRiNi Infra repository

## Организация доступа к виртуальной машине прозрачно через Bastion host

```bash
eval `ssh-agent -s`
ssh-add -L
ssh-add gcp_appuser
```
Помимо действий в методичке добавить в файл .ssh/config следующее содержимое
```bash
Host bastion
    ForwardAgent yes
    User appuser
    IdentityFile /root/gcp_appuser
    HostName <bastion.public.ip.address>
    RequestTTY yes
Host someinternalhost
    User appuser
    ProxyCommand ssh bastion -W 10.156.0.2:22
```
Теперь к внутреннему хосту можно подключиться по команде: ssh someinternalhost
Для подключения с использованием команды вида someinternalhost добавьте следующую строку в файл ~/.bashrc
```
alias someinternalhost='ssh someinternalhost'
```


bastion_IP = 35.242.142.140
someinternalhost_IP = 10.156.0.2

## Домашнее задание №4

Создание виртуальной машины со стартап скриптом
```bash
gcloud compute instances create reddit-app  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure  --metadata-from-file startup-script=startup.sh
```
Добавление разрешающего правила в межсетевой экран
```bash
gcloud compute firewall-rules create "default-puma-server" --allow tcp:9292 --source-ranges="0.0.0.0/0" --target-tags="puma-server"
```
Данные для проверки:
testapp_IP = 35.189.121.40
testapp_port = 9292

## Домашнее задание №5

Задание выполнено, собран reddit-full образ с использованием файла переменных. Запуск сервера puma осуществляется из стартап скрипта при выполнении команды gcloud.
Команда gcloud оприсана в скрипте config-scripts/create-redditvm.sh

## Домашнее задание №6

Задание выполнено. Создана VM с помощью terraform, с применением переменных.

##Домашнее задание №8 к уроку №10

Задание выполнено. Установил ansible. Попробовал подключиться к виртуальным машинам и выполнить команды на них, как с помощью  модулей command и sell, так и с помощью других модулей. Магия пропала))) теперь всё ясно))
