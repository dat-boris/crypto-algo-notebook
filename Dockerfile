FROM jupyter/scipy-notebook:2c80cf3537ca
# https://github.com/jupyter/docker-stacks/blob/master/scipy-notebook/Dockerfile

MAINTAINER boris@techie.im

USER root

RUN apt-get update && \
    apt-get install -y libopenblas-base && \
    apt-get clean

USER $NB_UID

RUN pip install zipline
RUN pip install enigma-catalyst
# https://github.com/quantopian/zipline/issues/1870
RUN pip install pandas==0.19.2
# https://github.com/quantopian/pyfolio/issues/393
RUN pip install empyrical==0.2.2

RUN catalyst ingest-exchange -x bitfinex -i btc_usd
