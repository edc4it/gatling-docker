# gatling-docker

Gatling container used during our courses

Example usage (from our k8s course)

```shell
docker run --rm \
  -v ~/course/k8s/availability/user-files:/opt/gatling/user-files \
  -v ~/course/k8s/availability/results:/opt/gatling/results \
  -e JAVA_OPTS="-Daddress=$(minikube service -n lab-performance-tuning --url payment-gateway)"  \
  edc4it/gatling:3.3.1 -rd "Availability Lab"
```
