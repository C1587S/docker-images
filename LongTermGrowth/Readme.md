## Dockerfile V0

Set:

```
DIR=$(pwd) #path where this git repository is cloned, example: /home/user/dockerfiles
CONTAINER_NAME=longtermgrowth
IMAGE_NAME_V0=lgt_blink
```

Build image:

```
docker build --tag $IMAGE_NAME_V0 .
```

Running `longtermgrowth` docker image in a docker container:

```
docker run --gpus all --rm -v $DIR:/home/shared_volume --name $CONTAINER_NAME -p 8888:8888 -d $IMAGE_NAME_V0
```
## Dockerfile V1

Set:

```
DIR=$(pwd) #path where this git repository is cloned, example: /home/user/dockerfiles
CONTAINER_NAME=longtermgrowth_v1
IMAGE_NAME_V1=lgt_blink_v1
```

```
docker build --tag $IMAGE_NAME_V1 .
```

Running `longtermgrowth_v1` docker image in a docker container:

```
docker run --gpus all --rm -it -p 8787:8787 -p 8888:8888 --name $CONTAINER_NAME -v $PWD:/home/shared_volume $IMAGE_NAME_V1
```

Running Jupyterlab:

```
run_jpt
```

OR:

```
jupyter lab --debug --ip=0.0.0.0 --NotebookApp.token=""  --NotebookApp.password=""
```

Then copy and paste in a browser the link provided.
