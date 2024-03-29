# Домашнее задание к занятию 1. «Типы и структура СУБД»


## Задача 1

Архитектор ПО решил проконсультироваться у вас, какой тип БД 
лучше выбрать для хранения определённых данных.

Он вам предоставил следующие типы сущностей, которые нужно будет хранить в БД:

- электронные чеки в json-виде,
- склады и автомобильные дороги для логистической компании,
- генеалогические деревья,
- кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации,
- отношения клиент-покупка для интернет-магазина.

Выберите подходящие типы СУБД для каждой сущности и объясните свой выбор.

## Решение

- электронные чеки в json-виде,

        Документо-ориентированные БД
- склады и автомобильные дороги для логистической компании,

        Графовые БД ввиду изначальной графовой стркутуры данных, склады узлы, дороги связи
- генеалогические деревья,

        БД построенные на основе иерархической или сетевой модели данных 
- кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации,

        NoSQL БД типа ключ-значение, так как время жизни данных ограничено
- отношения клиент-покупка для интернет-магазина.

        Реляционые БД так как хранящаяся информация строго структурирована и свзана с массой сопутствующей информации



## Задача 2

Вы создали распределённое высоконагруженное приложение и хотите классифицировать его согласно 
CAP-теореме. Какой классификации по CAP-теореме соответствует ваша система, если 
(каждый пункт — это отдельная реализация вашей системы и для каждого пункта нужно привести классификацию):

- данные записываются на все узлы с задержкой до часа (асинхронная запись);
- при сетевых сбоях система может разделиться на 2 раздельных кластера;
- система может не прислать корректный ответ или сбросить соединение.

Согласно PACELC-теореме как бы вы классифицировали эти реализации?

## Решение

- данные записываются на все узлы с задержкой до часа (асинхронная запись);
        
      CAP - PA
      PACELC - PA / EC

- при сетевых сбоях система может разделиться на 2 раздельных кластера;
        
      CAP - CA
      PACELC - PA/EC

- система может не прислать корректный ответ или сбросить соединение.
        
      CAP - PC 
      PACELC - PC/EL

## Задача 3

Могут ли в одной системе сочетаться принципы BASE и ACID? Почему?

## Решение

      Нет не могут, так как BASE прямо противопоставляется ACID.
      ACID гарнтированно надежные пердсказуемые системы, за счет производительности
      BASE высокопроизводительных систем, за счет базовой доступности и возможной согласованности только в конечном итоге 


## Задача 4

Вам дали задачу написать системное решение, основой которого бы послужили:

- фиксация некоторых значений с временем жизни,
- реакция на истечение таймаута.

Вы слышали о key-value-хранилище, которое имеет механизм Pub/Sub. 
Что это за система? Какие минусы выбора этой системы?
  
## Решение
    

      Судя по всему имеется ввиду хранилище Redis «ключ-значение» с механизмом Pub/Sub. Поддерживающая систему управления
      временем жизни сообщений

      По мунас системы, например в статье на хабре упоминается: 
        - Если издатель по каким-либо причинам выходит из строя, то он теряет всех своих подписчиков
        - Издателю необходимо знать точный адрес всех его подписчиков
        - Издатель может перегрузить работой своих подписчиков, если данные публикуются быстрее, чем обрабатываются
        - Сообщение удаляется из буфера издателя сразу после публикации, не зависимо от того,
          какому числу подписчиков оно доставлено и как быстро те сумели обработать это сообщение.
        - Все подписчики получат сообщение одновременно. Подписчики сами должны как-то между собой согласовывать порядок
          обработки одного и того же сообщения.
        - Нет встроенного механизма подтверждения успешной обработки сообщения подписчиком.
          Если подписчик получил сообщение и свалился во время обработки, то издатель об этом не узнает.
      
      На мой взгляд это просто особенности работы которые необходимо учитывать при проектирование решения
      
      