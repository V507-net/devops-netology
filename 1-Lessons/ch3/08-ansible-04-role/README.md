
Домашнее задание к занятию 3 «Использование Ansible»

## Описание плейбука [site.yml](playbook%2Fsite.yml)
   Данный [плейбук](playbook%2Fsite.yml) устанавливает и настраивает ClickHouse, Vector и Lighthouse.

   Окружение в Yandex cloud подготавливается с помощью [Terraform](playbook%2Fmain.tf), после этого в файл [prod.yaml](playbook%2Fprod.yaml) записываются внешние адреса хостов в формате Ansible inventory файла для дальнейшего использования с плейбуком, также в файл /group_vars/all/[vars.yml](playbook%2Fgroup_vars%2Fall%2Fvars.yml) записываются переменные с IP-адресами устанавливаемых систем.   
  
## Установка 

1. Подготовить окружение для установки с помощью [Terraform](playbook%2Fmain.tf).
2. Можно использовать тэги для индивидуальной установки систем `clickhouse` `vector` `lighthouse`
3. Шаблоны конфигураций [nginx](playbook%2Ftemplates%2Fnginx_config.j2) и [vector](playbook%2Ftemplates%2Fvector_config.j2) 
3. Запустить playbook  [site.yml](playbook%2Fsite.yml) с параметрами окружения [prod.yaml](playbook%2Fprod.yaml), 
   которые задаются в процессе подготовки окружения с помощью Terraform
         
        Пример: ansible-playbook site.yml -i prod.yaml





