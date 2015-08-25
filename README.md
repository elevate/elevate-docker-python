# Base image with Python + Miniconda

Run `build.sh` to build a tagged image and push it to a private registry. Or simply run `docker build -t whatever .` to get a local image

To upgrade conda/miniconda, change the versions in the files `conda-version` and `miniconda-version`, where:

* `miniconda-version` is the version of the main miniconda package (e.g. Miniconda3-3.10.1-Linux-x86_64.sh)
* `conda-version` is the version of conda being actually used in the image (through `conda install`)

and re-run `build.sh`
