## Build

```bash
docker build --tag school_markets . 
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

```bash
docker run -d  \
    --name sm_container \
    -e USER=cie \
    -e PASSWORD=smarkets \
    -p 8787:8787 \
    -v $(pwd):/home/cie \
    school_markets
```

## Stop container

```bash
docker stop rpp_container 
```