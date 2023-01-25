---

## Задача 1

- Опишите своими словами основные преимущества применения на практике IaaC паттернов.
- 
            Основное преимущество это возможность автоматизированой сборки и развертывания,
            уменшение затрат на кофигурирование инфраструтры.
- 
- Какой из принципов IaaC является основополагающим?
            
            Идемпотентность —  при повторном выполнении получение результат идентичного предыдущему

## Задача 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?

            Простота использование, понятный и простой синтаксис, на целевых хостах не нужны агенты
            
- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?

            Все зависит от конкретной конфигурации и опыта использования, оба метода могут обладать этой храктеристикой 
## Задача 3

Установить на личный компьютер:

- VirtualBox
---
PS C:\Program Files\Oracle\VirtualBox> .\VBoxManage.exe --version
7.0.4r154605
---
- Vagrant
---
PS C:\Program Files\Oracle\VirtualBox> vagrant --version
Vagrant 2.3.2
---
- Ansible
---
vagrant@server1:~$ ansible --version
ansible 2.9.6
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/vagrant/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.10 (default, Mar 15 2022, 12:22:08) [GCC 9.4.0]
---

*Приложить вывод команд установленных версий каждой из программ, оформленный в markdown.*

## Задача 4 (*)

Воспроизвести практическую часть лекции самостоятельно.

- Создать виртуальную машину.
- Зайти внутрь ВМ, убедиться, что Docker установлен с помощью команды
```
docker ps
```
![img.png](img.png)