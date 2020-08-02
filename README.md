# Test_SRE

<p><strong>Deploy RabbitMQ cluster on k8s</strong></p>
 https://habr.com/ru/company/true_engineering/blog/419817/
 https://www.rabbitmq.com/clustering.html
 https://www.rabbitmq.com/cluster-formation.html

<p><strong>Migration from vm to k8s cluster</strong>></p>
 https://habr.com/ru/company/flant/blog/450662/ 

<p><strong>Documentation</strong></p>
<p></p>
 https://kubernetes.io/
 https://www.rabbitmq.com
 https://www.rabbitmq.com/kubernetes/operator/operator-overview.html

<p>полное зеркалирование всех содержащихся в кластере данных, что позволяет работать RabbiqMQ</p>
<p>в случае в случае работоспособности только одной ноды.</p>
<p>Под сомнением необходимость deploy StatefulSet RabbitMQ, при кластерной конфигурации.</p>
<p>для чего сохранять состояние pod'а, если есть зеркалирование всех содержащихся в кластере данных.</p>

<p><strong>Использована кластерная архитектура RabbitMQ.</strong></p>
<p> вариант несколько кластеров RabbitMQ</p>
<p>пример:3 ноды k8s, два pods на каждой ноде,6 pods объедены в два кластера,</p>
<p>зеркалирование очереди между кластерами.</p>

<p>Повысит:</p>
<p>отказоустойчивость, избыточность, но не маштабируемость.</p>

https://habr.com/ru/company/itsumma/blog/471858/
https://club.directum.ru/post/255245

<p><strong>возможный тюннинг RabbitMQ:</strong></p>
<p>ограничение длины очереди,</p>
<p>использования Lazy queues(в качестве сохранения, возможно лучше использовать отдельный pods RabbitMQ)</p>
<p>ограничение размера TTL или или max-lenght</p>

<p>минусы:</p> 
<p>ресурсоемкость, стоимость владения.</p>
<p>плюсы:</p> 
<p>отказоустойчивость, в меньшей степени маштабируемость.</p>

<p>выбор подхода обусловлен комбинацией различных методов, что повышает отказоустойчивость и маштабирумость.</p>

# Update
<p>развернул стенд:</p>
<p>для развертования в YandexCloud(TRIAL) использовал terraform 0.12.29, образ для развертывания взят из yandex repo.</p>
    
    
<strong>documentation</strong></p>

  https://www.terraform.io/
  https://github.com/selectel/terraform-examples
  https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart
  https://cloud.croc.ru/blog/byt-v-teme/klaster-za-chas/

   