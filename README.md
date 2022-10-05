# devops-netology



Домашнее задание по лекции "Введение в DevOps"

netology.tf – терраформ,
netology.sh – bash,
netology.md – markdown,
netology.yaml – yaml,
netology.jsonnet – jsonnet.


## Домашнее задание к занятию «2.1. Системы контроля версий.»

    Добавлен файлы /terraform/file.ignore и terraform/.gitignore в котором прописан файл file.ignore
    Сделанны необходимые коммиты по перемещению и удалению файлов
    Коммита для ветки main после fix
## Домашнее задание к занятию «2.3. Ветвления в Git»

    Подготовлены ветки git-merge и git-rebase к дальнейшим действиям
    Слияние git-merge прошло успешно
    Слияние git-rebase с main после разрешения конфликтов
    Готово
## Домашнее задание к занятию «2.4. Инструменты Git»

1.Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.

      git show aefea
      commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
2.Какому тегу соответствует коммит 85024d3?

      tag: v0.12.23
      git show 85024d3 
      commit 85024d3100126de36331c6982bfaac02cdab9e76 (tag: v0.12.23)
3.Сколько родителей у коммита b8d720? Напишите их хеши.

      родителя: 56cd7859e05c36c06b56d013b55a252d0bb7e158 9ea88f22fc6269854151c571162c5bcf958bee2b
4.Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.

      b14b74c493 [Website] vmc provider links
      3f235065b9 Update CHANGELOG.md
      6ae64e247b registry: Fix panic when server is unreachable
      5c619ca1ba website: Remove links to the getting started guide's old location
      06275647e2 Update CHANGELOG.md
      d5f9411f51 command: Fix bug when using terraform login on Windows
      4b6d06cc5d Update CHANGELOG.md
      dd01a35078 Update CHANGELOG.md
      225466bc3e Cleanup after v0.12.23 release 
5.Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточего перечислены аргументы).

      commit 8c928e83589d90a031f811fae52a81be7153e82f
6.Найдите все коммиты в которых была изменена функция globalPluginDirs. 
        
    125eb51dc4 Remove accidentally-committed binary
    22c121df86 Bump compatibility version to 1.3.0 for terraform core release (#30988)
    35a058fb3d main: configure credentials from the CLI config file
    c0b1761096 prevent log output during init
    8364383c35 Push plugin discovery down into command package
7.Кто автор функции synchronizedWriters?

    Martin Atkins 