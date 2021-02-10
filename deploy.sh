docker build -t deepak12398/multi-client:latest -t deepak12398/multi-client:$GIT_SHA -f ./client/Dockerfile.dev ./client
docker build -t deepak12398/multi-server:latest -t deepak12398/multi-server:$GIT_SHA -f ./server/Dockerfile.dev ./server
docker build -t deepak12398/multi-worker:latest -t deepak12398/multi-worker:$GIT_SHA -f ./worker/Dockerfile.dev ./worker
docker push deepak12398/multi-client:latest
docker push deepak12398/multi-server:latest
docker push deepak12398/multi-worker:latest
docker push deepak12398/multi-client:$GIT_SHA
docker push deepak12398/multi-server:$GIT_SHA
docker push deepak12398/multi-worker:$GIT_SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=deepak12398/multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=deepak12398/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=deepak12398/multi-worker:$GIT_SHA