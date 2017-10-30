# ps.sh
# shell script to start ps

# data_dir --       [string] Directory for storing mnist data
# download_only --  [boolean] Only perform downloading of data; Do not proceed
#                   to session preparation, model definition or training.
# task_index --     [int] Worker task index, should be >= 0. task_index=0 is
#                   the master worker task the performs the variablE
#                   initialization
# num_gpus --       [int] Total number of gpus for each machine.
#                   If you don't use GPU, please set it to 0
# replicas_to_aggregate --
#                   [int] Number of replicas to aggregate before parameter update"
#                   is applied (For sync_replicas mode only; default: 
#                   num_workers)
# hidden_units --   [int] Number of units in the hidden layer of the NN
# train_steps --    [int] Number of (global) training steps to perform
# learning_rate --  [float] Learning rate
# sync_replicas --  [boolean] Use the sync_replicas (synchronized replicas)
#                   mode, wherein the parameter updates from workers are
#                   aggregated before applied to avoid stale gradients
# existing_servers --
#                   [boolean] Whether servers already exists. If True,
#                   will use the worker hosts via their GRPC URLs (one client 
#                   process per worker host). Otherwise, will create an
#                   in-process TensorFlow server.
# ps_hosts --       [string] Comma-separated list of hostname:port pairs
# worker_hosts --   [string] Comma-separated list of hostname:port pairs
# job_name --       [string] job name: worker or ps
sudo docker build -t tensorflow-dist-MNIST ..
sudo docker run -d -p 80:6006 --cpus="1" \
            --memory="4g" \
            --network="bridge" \
            --name="ps0" \
            --ip="172.17.0.10" \
            --mount source=<location_on_server,target=<location_on_container>
exec python mnist_replica.py --data_dir= \
            #--task_index= #\ no task index because ps vs. worker?
            --sync_replicas="True"\
            --ps_hosts="172.17.0.10:2222" \
            --worker_hosts="172.17.0.100:2222, 172.17.0.101:2222, 172.17.0.102:2222" \
            --job_name="ps0"
            
# resources:
# https://docs.docker.com/engine/admin/resource_constraints/#limit-a-containers-access-to-memory
# https://www.tensorflow.org/deploy/distributed
# https://docs.docker.com/engine/userguide/networking/#the-default-bridge-network
# https://docs.docker.com/engine/admin/resource_constraints/

