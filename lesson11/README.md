# Опис уроку 11

Створено контейнер який пише кожні 5 секунд в файл на PV. 3 Репліки і HPA для деплоймента. Коментарі в .yaml файлах. 

Додавання helm repo prometheus і встановлення stack
`microk8s.helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
`microk8s.helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring`

Додавання helm repo grafana і встановлення stack
`microk8s.helm repo add grafana https://grafana.github.io/helm-charts`
`microk8s.helm install grafana grafana/grafana -n monitoring --set service.type=NodePort --set service.nodePort=32000`

Встановлення loki
`microk8s.helm install loki grafana/loki-stack -n monitoring --set loki.commonConfig.replication_factor=1 --set loki.auth_enabled=false`

Встановлення fluentd
`microk8s.helm repo add fluent https://fluent.github.io/helm-charts`

```
microk8s.helm install fluentd fluent/fluentd \
  --set output.loki.enabled=true \
  --set output.loki.url="http://loki:3100/loki/api/v1/push"
```