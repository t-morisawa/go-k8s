docker build -t localhost:5000/go-k8s-src -f ./src/Dockerfile.src .
kubectl delete -f ./src/src.yaml
kubectl apply -f ./src/src.yaml

docker build -t localhost:5000/go-k8s-grpc -f ./grpc/Dockerfile.grpc .
kubectl delete -f ./grpc/grpc.yaml
kubectl apply -f ./grpc/grpc.yaml
