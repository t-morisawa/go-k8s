# go-k8s

## ローカル

```
cd src
GRPC_HOST=localhost go run main.go
```

http://0.0.0.0:5050/ping

## kubernetes環境へのビルド

イメージのビルド

```
docker build -t localhost:5000/go-k8s-src -f ./src/Dockerfile.src .
docker build -t localhost:5000/go-k8s-grpc -f ./grpc/Dockerfile.grpc .
```

ローカルでレジストリを起動（これにより、k8sがローカルのDockerイメージをpullできる） [参考文献](https://stackoverflow.com/questions/57167104/how-to-use-local-docker-image-in-kubernetes-via-kubectl)


```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

podをapply

```
kubectl apply -f ./src/src.yaml
kubectl apply -f ./grpc/grpc.yaml
```

### 更新

```
. ./bin/update.sh
```

## protocol buffersのビルド

```
. ./bin/build_proto.sh
```
