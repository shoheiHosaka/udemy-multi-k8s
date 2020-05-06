docker build -t shoheihosaka/udemy-multi-client:latest -t shoheihosaka/udemy-multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t shoheihoaska/udemy-multi-server:latest -t shoheihosaka/udemy-multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t shoheihosaka/udemy-multi-worker:latest -t shoheihosaka/udemy-multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push shoheihosaka/udemy-multi-client:latest
docker push shoheihosaka/udemy-multi-server:latest
docker push shoheihosaka/udemy-multi-worker:latest

docker push shoheihosaka/udemy-multi-client:$SHA
docker push shoheihosaka/udemy-multi-server:$SHA
docker push shoheihosaka/udemy-multi-worker:$SHA


kubectl apply -f k8s
kubectl set image deployments/client-deployment client=shoheihosaka/udemy-multi-client:$SHA
kubectl set image deployments/server-deployment server=shoheihosaka/udemy-multi-server:$SHA
kubectl set image deployments/worker-deployment worker=shoheihosaka/udemy-multi-worker:$SHA