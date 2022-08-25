# build image
sudo docker build -t 3cc_binbot .

# run interactive bash
sudo docker run --gpus all --rm -it --name cont_binbot \
        -v $PWD:/home/shared_volume/ 3cc_binbot

# run in jupyterlab
docker run --gpus all \
	--rm \
	-it \
	-p 8888:8888 -p 8787:8787 -p 8786:8786 \
	--name cont_binbot \
	-v $PWD:/home/shared_volume 3cc_binbot