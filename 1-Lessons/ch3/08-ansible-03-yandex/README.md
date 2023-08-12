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
2. Запустить playbook  [site.yml](playbook%2Fsite.yml) с параметрами окружения [prod.yml](playbook%2Finventory%2Fprod.yml)
         
        Пример: ansible-playbook site.yml -i inventory/prod.yml