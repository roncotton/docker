# tensorflow-dist-MNIST
# ronald.cotton@wsu.edu

FROM ubuntu:16.04
# vs. latest incase install method changes

# update machine
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends python-pip python-dev python-setuptools unzip wget time
RUN apt-get clean && apt-get autoremove

RUN rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN pip install protobuf scipy h5py tensorflow tflearn

RUN pip install --ignore-installed --upgrade https://github.com/roncotton/tf-wheel-linux/raw/master/2.7/tensorflow-1.3.0-cp27-cp27mu-linux_x86_64.whl

#TODO run shell scripts

#Very big, doing alternative by downloading Github Raw
#RUN wget https://github.com/tflearn/tflearn/archive/master.zip
#RUN unzip master.zip

# don't benchmark first run... has to download dataset
#RUN python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py
#RUN time python ./tflearn-master/examples/images/convnet_cifar10.py 

# home dir is work dir
WORKDIR "/"
