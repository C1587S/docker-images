## Build

```bash
docker build --tag rpp . 
```


## Running container-volume

```bash
docker run -d \
  --rm \
  --name rpp_container \
  -v $(pwd)/notebooks:/home/shared_volume\
  -p 8888:8888 \
  -e JUPYTER_TOKEN=letmein \
  -e GRANT_SUDO=yes \
  --user root \
  rpp
```

## Stop container

```bash
docker stop rpp_container 
```
