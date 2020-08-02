# Test_SRE

Deploy RabbitMQ cluster on k8s 

 https://habr.com/ru/company/true_engineering/blog/419817/
 https://www.rabbitmq.com/clustering.html
 https://www.rabbitmq.com/cluster-formation.html
 
Migration from vm to k8s cluster

 https://habr.com/ru/company/flant/blog/450662/ 

Documentation

 https://kubernetes.io/
 https://www.rabbitmq.com
 https://www.rabbitmq.com/kubernetes/operator/operator-overview.html

полное зеркалирование всех содержащихся в кластере данных, что позволяет работать RabbiqMQ
в случае в случае работоспособности только одной ноды.
Под сомнением необходимость deploy StatefulSet RabbitMQ, при кластерной конфигурации.
для чего сохранять состояние pod'а, если есть зеркалирование всех содержащихся в кластере данных.

Использована кластерная архитектура RabbitMQ.
вариант несколько кластеров RabbitMQ
пример:3 ноды k8s, два pods на каждой ноде,6 pods объедены в два кластера,
зеркалирование очереди между кластерами.
Повысит:
 отказоустойчивость, избыточность, но не маштабируемость.
 
https://habr.com/ru/company/itsumma/blog/471858/
https://club.directum.ru/post/255245
 
 возможжный тюнинг RabbitMQ: 
   ограничение длины очереди,
   использования Lazy queues(в качестве сохранения
   возможно лучше использовать отдельный pods RabbitMQ)
     
 минусы: ресурсоемкость, стоимость владения.
 плюсы: отказоустойчивость, в меньшей степени маштабируемость. 

выбор подхода обусловлен комбинацией различных методов, что повышает результат. 


# Update
развернул стенд:
  для развертования в YandexCloud(TRIAL) использовал terraform 0.12.29, 
   образ для развертывания взят из yandex repo.
    
 
documentation   
  https://www.terraform.io/
  https://github.com/selectel/terraform-examples
  https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart
  https://cloud.croc.ru/blog/byt-v-teme/klaster-za-chas/
    
  
   