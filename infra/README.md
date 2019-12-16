# Adding GKE to Gitlab
https://gitlab.com/help/user/project/clusters/add_remove_clusters.md#add-existing-cluster

# Deploy Redis on GKE
helm install --name eleven-integration stable/postgresql

```Output

PostgreSQL can be accessed via port 5432 on the following DNS name from within your cluster:

    eleven-integration-postgresql.default.svc.cluster.local - Read/Write connection

To get the password for "postgres" run:

    export POSTGRES_PASSWORD=$(kubectl get secret --namespace default eleven-integration-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)

To connect to your database run the following command:

    kubectl run eleven-integration-postgresql-client --rm --tty -i --restart='Never' --namespace default --image docker.io/bitnami/postgresql:11.6.0-debian-9-r0 --env="PGPASSWORD=$POSTGRES_PASSWORD" --command -- psql --host eleven-integration-postgresql -U postgres -d postgres -p 5432

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace default svc/eleven-integration-postgresql 5432:5432 &
    PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U postgres -d postgres -p 5432

```

# Deploying Redis on GKE
helm install --name eleven-integration-sidekiq stable/redis --set cluster.enabled=false

```Output

eleven-integration-sidekiq-redis-master.default.svc.cluster.local for read/write operations

To get your password run:

    export REDIS_PASSWORD=$(kubectl get secret --namespace default eleven-integration-sidekiq-redis -o jsonpath="{.data.redis-password}" | base64 --decode)

To connect to your Redis server:

1. Run a Redis pod that you can use as a client:

   kubectl run --namespace default eleven-integration-sidekiq-redis-client --rm --tty -i --restart='Never' \
    --env REDIS_PASSWORD=$REDIS_PASSWORD \
   --image docker.io/bitnami/redis:5.0.7-debian-9-r12 -- bash

2. Connect using the Redis CLI:
   redis-cli -h eleven-integration-sidekiq-redis-master -a $REDIS_PASSWORD
   redis-cli -h eleven-integration-sidekiq-redis-slave -a $REDIS_PASSWORD

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace default svc/eleven-integration-sidekiq-redis-master 6379:6379 &
    redis-cli -h 127.0.0.1 -p 6379 -a $REDIS_PASSWORD

```