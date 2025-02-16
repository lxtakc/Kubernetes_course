
Створення контейнера 0.1
sudo docker build -t lxtakc/my-nginx:0.1 . 
Завантаження на Dockerhub
sudo docker push lxtakc/my-nginx:0.1

Створення контейнера 0.2
sudo docker build -t lxtakc/my-nginx:0.2 .
Завантаження на Dockerhub
sudo docker push lxtakc/my-nginx:0.2

Запуск контейнера. Образ буде завантажений з Dockerhub
sudo docker run -d --name nginx-test -p 8080:80 lxtakc/my-nginx:0.1
sudo docker run -d --name nginx-test -p 8080:80 lxtakc/my-nginx:0.2

Завантаження образу
sudo docker pull lxtakc/my-nginx:0.2

Адреса репо https://hub.docker.com/r/lxtakc/my-nginx/tags
