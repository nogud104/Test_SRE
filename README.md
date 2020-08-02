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

Использована кластерная архитектура RabbitMQ,
полное зеркалирование всех содержащихся в кластере данных, что позволяет работать RabbiqMQ
в случае в случае работоспособности только одной ноды.
Под сомнением необходимость deploy StatefulSet RabbitMQ, при кластерной конфигурации.
для чего сохранять состояние pod'а, если есть зеркалирование всех содержащихся в кластере данных.

# Update
развернул стенд:
  terraform
  YandeCloud(TRIAL)
   