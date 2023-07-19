## Описание плейбука [site.yml](playbook%2Fsite.yml)
  Плейбук для установки ClickHouse и Vector.
  
## Версии и требования
Плейбук написан и протестирован в следующем окружении:
- ansible 2.9.6
- python  3.8.10
- Docker  20.10.23
- Docker Compose  v2.17.2
- операционная система CentOS 7  

Версии устанавливаемого ПО задаются в файлах переменных  [group_vars](playbook%2Fgroup_vars)

## Установка 

1. Подготовить окружение для установки с помощью Docker [docker-compose.yml](playbook%2Fdocker-compose.yml)
2. Отредактировать при необходимости [group_vars](playbook%2Fgroup_vars) и [templates](playbook%2Ftemplates)
3. Запустить playbook  [site.yml](playbook%2Fsite.yml) с параметрами окружения [prod.yml](playbook%2Finventory%2Fprod.yml)
         
        ansible-playbook site.yml -i inventory/prod.yml
4. Для обновления конфигурации Vector использовать тэг update_vector_conf

        ansible-playbook site.yml -i inventory/prod.yml --tags update_vector_conf