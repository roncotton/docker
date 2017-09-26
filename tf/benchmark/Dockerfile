# benchmark
# ronald.cotton@wsu.edu

FROM ubuntu:16.04
# vs. latest incase to future proof install method

# update machine
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends vim sysbench python3-pip unzip wget 
#	&& apt-get install git -y \
RUN apt-get clean && apt-get autoremove

RUN rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

#RUN git clone https://github.com/roncotton/sysbench-benchmark.git
RUN wget https://github.com/roncotton/sysbench-benchmark/archive/master.zip

RUN unzip master.zip

RUN python3 /sysbench-benchmark-master/bench.py

# home dir is work dir
WORKDIR "/"

