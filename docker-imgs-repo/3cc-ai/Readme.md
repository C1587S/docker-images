## Runing container
docker run --gpus all --rm -it --name container3ctrading -v ~/Github/3cc_ai_trader:/home/3ccAI 3cc_ai_py3.7:latest

## using jupyterlab
docker run --gpus all --rm -it -p 8888:8888 -p 8787:8787 -p 8786:8786 \
--name container3ctrading -v ~/Github/3cc_ai_trader:/home/3ccAI 3cc_ai_py3.7:latest
