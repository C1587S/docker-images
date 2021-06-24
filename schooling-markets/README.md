## Build

```bash
docker build --tag school_markets . 
```

## Running container-volume

```bash
docker run -d  \
    --rm \
    --name sm_container \
    -e USER=cie \
    -e PASSWORD=smarkets \
    -p 8787:8787 \
    -v $(pwd):/home/cie \
    school_markets
```

## Stop container

```bash
docker stop school_markets 
```