# go-k8s

## ローカル

```
cd src
go run main.go
```

http://0.0.0.0:5050/ping

## kubernetes

イメージのビルド

```
docker build -t localhost:5000/go-k8s .
```

ローカルでレジストリを起動（これにより、k8sがローカルのDockerイメージをpullできる）

```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

podをapply

```
kubectl apply -f pod.yaml
kubectl apply -f service.yaml
```


参考文献

https://stackoverflow.com/questions/57167104/how-to-use-local-docker-image-in-kubernetes-via-kubectl
