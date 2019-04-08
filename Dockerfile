FROM buildpack-deps:stretch-curl

# Based on https://github.com/mausch/docker-images/blob/master/miniconda3/Dockerfile

COPY miniconda-version .
COPY conda-version .

RUN apt-get update && apt-get install bzip2=1.0.6-7+b3

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget https://repo.continuum.io/miniconda/Miniconda3-$(cat miniconda-version)-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-$(cat miniconda-version)-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-$(cat miniconda-version)-Linux-x86_64.sh && \
    /opt/conda/bin/conda install --yes conda==$(cat conda-version) && \
    /opt/conda/bin/conda clean --tarballs

ENV PATH /opt/conda/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

CMD ["python"]
