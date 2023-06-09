#!/bin/bash
echo "Проверка наличия файлов конфигураций..."

if [[ -f "docker-compose.yml" ]]; then
	echo "Docker-compose...OK"
else
    echo "Файл docker-compose.yml не найден"
    exit 1	
fi
if [[ -f "site.yml" ]]; then
	echo "Playbook site.yml...OK"
else
    echo "Файл site.yml не найден"
    exit 1		
fi	
if [[ -f "inventory/prod.yml" ]]; then
	echo "Inventory prod.yml...OK"
else
    echo "Файл prod.yml не найден"
    exit 1	
fi	

docker-compose -f docker-compose.yml up -d
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
docker-compose down
