#Створення мережі Bridge з підмережею 
docker network create --driver=bridge --subnet=192.168.70.0/24 --opt com.docker.network.bridge.name=br0 lxtakc_network

#Створення контейнерів з dns search доменом
docker run -d --name mycont1 --network lxtakc_network --dns-search=home.lab busybox sleep 3600
docker run -d --name mycont2 --network lxtakc_network --dns-search=home.lab busybox sleep 3600

#Пінг між контейнерами по імені
docker exec -it mycont1 ping mycont2

#Створення контейнера з Host типом
docker run -d --name nginx_cont --network host nginx:stable-alpine
#Перевірка адаптерів в контейнері
docker run --rm --network none alpine:latest ip link show

#Створення мережі Macvlan
docker network create -d macvlan \
  --subnet=192.168.69.0/24 \
  --gateway=192.168.69.1 \
  -o parent=enp1s0 \
  -o macvlan_mode=bridge my_macvlan_network

#Створення контейнера з DHCP на мережі Macvlan
docker run -d --name macvlan_dhcp --network my_macvlan_network --rm busybox sleep 3600

#Створення Volume
docker volume create test_vol

#Створення контейнерів з Volume test_vol
docker run -d --name file01 -v test_vol:/vol alpine:latest sleep 3600
docker run -d --name file02 -v test_vol:/vol alpine:latest sleep 3600


#Створення файлу на першому контейнері
docker exec -it file01 sh
/ # cd /vol/
/vol # ls
/vol # touch file_with_data
/vol # echo "Hello from File!" > file_with_data 
/vol # exit

#Вивід вмісту файла з другого контейнера
docker exec -it file02 cat /vol/file_with_data
