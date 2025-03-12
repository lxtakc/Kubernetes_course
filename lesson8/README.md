# Опис директив в уроці 8

## Service

```
apiVersion: v1
kind: Service
metadata:
  name: alex-service
spec:
  selector:
    app: alex-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP
```
`apiVersion` - версія Kubernetes API.

`kind` - тип об'єкту.

`metadata` - данні, які допомогають уніфікувати об'єкт. `name`, `UID`, `namespace`

`spec` - описує стан об'єкта. 

`selector` - описує pods, які використовує сервіс. 

`type` - визначає тип сервісу. `ClusterIP`, `NodePort` тощо. 


## Deployment

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: alex-deployment 
spec:
  replicas: 3
  selector:
    matchLabels:
      app: alex-app
  template:
    metadata:
      labels:
        app: alex-app
    spec:
      containers:
        - name: my-container 
          image: nginx:latest
          ports:
            - containerPort: 80

```

`apiVersion` - версія Kubernetes API.

`kind` - тип об'єкту.

`metadata` - данні, які допомогають уніфікувати об'єкт. `name`, `UID`, `namespace`

`spec` - описує стан об'єкта. 

`replicas` - описує кількість реплік pod'ів

`selector` - описує як ReplicaSet має знаходити pod'и для керування.

`template` - включає в себе: 

- `.metadata.labels` - поле.

- `spec` - вказує, що Pod'и будуть виконувати один контейнер.  