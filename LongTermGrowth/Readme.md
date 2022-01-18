Set:

```
DIR=$(pwd) #path where this git repository is cloned, example: /home/user/dockerfiles
CONTAINER_NAME=longtermgrowth
IMAGE_NAME=lgt_blink
```

Build image:

```
docker build --tag lgt_blink .
```

Running `longtermgrowth` docker image in a docker container:

```
docker run --gpus all --rm -v $DIR:/home/shared_volume --name $CONTAINER_NAME -p 8888:8888 -d $IMAGE_NAME
```
