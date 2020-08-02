# Test_SRE
<div>style="margin-top: 36pt; margin-bottom: 8pt;"
<p>Deploy RabbitMQ cluster on k8s</p>

 https://habr.com/ru/company/true_engineering/blog/419817/
 https://www.rabbitmq.com/clustering.html
 https://www.rabbitmq.com/cluster-formation.html
 
<p><strong>Migration from vm to k8s cluster</strong>></p>

 https://habr.com/ru/company/flant/blog/450662/ 

<p><strong>Documentation</strong></p>

 https://kubernetes.io/
 https://www.rabbitmq.com
 https://www.rabbitmq.com/kubernetes/operator/operator-overview.html

<p>полное зеркалирование всех содержащихся в кластере данных, что позволяет работать RabbiqMQ</p>
<p>в случае в случае работоспособности только одной ноды.</p>
<p>Под сомнением необходимость deploy StatefulSet RabbitMQ, при кластерной конфигурации.</p>
<p>для чего сохранять состояние pod'а, если есть зеркалирование всех содержащихся в кластере данных.</p>

<p><strong>Использована кластерная архитектура RabbitMQ.</strong></p>
 вариант несколько кластеров RabbitMQ
 пример:3 ноды k8s, два pods на каждой ноде,6 pods объедены в два кластера,
 зеркалирование очереди между кластерами.
<p><red>Повысит:</red></p>
 отказоустойчивость, избыточность, но не маштабируемость.
 
https://habr.com/ru/company/itsumma/blog/471858/
https://club.directum.ru/post/255245
 
  <p><strong><font color="yellow">возможный тюннинг RabbitMQ:</font color="blue"></strong></p>
  <p> ограничение длины очереди,</p>
  <p> использования Lazy queues(в качестве сохранения, возможно лучше использовать отдельный pods RabbitMQ)</p>
  <p> ограничение размера TTL или или max-lenght</p>
     
<p><font color="blue">минусы:</font color="blue"></p> 
    ресурсоемкость, стоимость владения.
<p><font color="red">плюсы:</font color="red"></p>
  отказоустойчивость, в меньшей степени маштабируемость.

<p><green>выбор подхода обусловлен комбинацией различных методов, что повышает отказоустойчивость и маштабирумость.</green></p>


# Update
<p><green>развернул стенд:</green></p>
  для развертования в <p><font color="yellow">YandexCloud(TRIAL)</p></font color="yellow"></p>использовал<p><font color="blue">terraform 0.12.29</font color="blue">,<p> 
   образ для развертывания взят из yandex repo.
    
 
documentation   
  https://www.terraform.io/
  https://github.com/selectel/terraform-examples
  https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart
  https://cloud.croc.ru/blog/byt-v-teme/klaster-za-chas/
</div>    
  
   