# Опис директив в уроці 8
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
