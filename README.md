# go-k8s

## ローカル

```
cd src
GRPC_HOST=localhost go run main.go
```

http://0.0.0.0:5050/ping

## kubernetes

イメージのビルド

```
docker build -t localhost:5000/go-k8s-src -f Dockerfile.src .
docker build -t localhost:5000/go-k8s-grpc -f Dockerfile.grpc .
```

ローカルでレジストリを起動（これにより、k8sがローカルのDockerイメージをpullできる）

```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

podをapply

```
kubectl apply -f src.yaml
kubectl apply -f grpc.yaml
```


参考文献

https://stackoverflow.com/questions/57167104/how-to-use-local-docker-image-in-kubernetes-via-kubectl

## protocol buffersのビルド

```
protoc --go_out=. --go_opt=paths=source_relative \
    --go-grpc_out=. --go-grpc_opt=paths=source_relative \
    proto/proto.proto
```
