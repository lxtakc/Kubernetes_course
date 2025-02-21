#Брідж використаний з попереднього уроку
#Білд fluentd контейнера
docker build -t fluentd-loki .

#Контейнер який генерує постійний запис в лог
docker run -d --name log_writer \
    --network lxtakc_network \
    --log-driver=fluentd --log-opt fluentd-address=localhost:24224 \
    alpine:latest sh -c 'while true; do echo "Log was written at $(date)"; sleep 3; done'

#Fluentd контейнер, який приймає логи і передає їх в контейнер
docker run -d --name fluentd --network lxtakc_network -v $(pwd)/fluentd.conf:/fluentd/etc/fluent.conf -p 24224:24224 -p 24224:24224/udp fluentd-loki

#Loki контейнер
docker run -d --name loki --network lxtakc_network -p 3100:3100 grafana/loki:latest


#Grafana
docker run -d --name grafana  --network lxtakc_network -p 3000:3000 -e GF_SECURITY_ADMIN_PASSWORD=admin -e "GF_DASHBOARD_DEFAULT_HOME_DASHBOARD_PATH=/etc/grafana/dashboards/default-dashboard.json" -e GF_SERVER_ROOT_URL=http://localhost:3000 -v $(pwd)/provisioning:/etc/grafana/provisioning grafana/grafana