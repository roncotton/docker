# deeplearning-wsuv
# ronald.cotton@wsu.edu

# cpu edition - both versions of python

# TODO to clean up this docker file
#  [ ] - need to add files to .dockerignore
#  [ ] - Containers should be ephemeral
#  [ ] - Avoid installing unnecessary packages

FROM ubuntu:16.04

# update machine
RUN apt-get update && apt-get upgrade

# required for many little programs
# should have worked. Didn't :(
RUN apt-get install -y --no-install-recommends apt-utils

# install build-essential, curl, git - use curl later to install
# additional files later
#RUN apt-get install -y build-essential curl
RUN apt-get install -y --no-install-recommends git

# tensorflow install with native pip - both python2 and python3 version

RUN apt-get install -y --no-install-recommends python-pip python-dev
RUN apt-get install -y --no-install-recommends python3-pip python3-dev

# update pip to 9.0.1
RUN pip install -U pip setuptools
RUN pip3 install -U pip setuptools

RUN pip2 install tensorflow
RUN pip3 install tensorflow

#RUN pip2 install 'numpy==1.11.0'

# download from git a binary wheel in my repo
# if numpy not the right version, this will fail...
#RUN pip install --ignore-installed --upgrade https://github.com/roncotton/tf-wheel-linux/raw/master/2.7/tensorflow-1.3.0-cp27-cp27mu-linux_x86_64.whl

# install bleeding edge for tflearn
RUN pip2 install tflearn h5py scipy cpickle
RUN pip3 install tflearn h5py scipy cpickle

# place additional code at home - these two could be removed or trimmed.
RUN git clone https://github.com/tensorflow/benchmarks.git /deeplearning/tensorflow-benchmarks
RUN git clone https://github.com/tflearn/tflearn.git /deeplearning/tflearn

# your going home
RUN cd ~

# ports needed - Tensorboard (6006)
EXPOSE 6006
#EXPOSE 8888

# home dir is work dir
WORKDIR "/deeplearning"

#other commands later
#CMD

# References:
# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#entrypoint
# https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images
