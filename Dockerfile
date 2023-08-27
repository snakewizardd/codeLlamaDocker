FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    sudo

RUN sudo apt install -y python3-pip 
RUN yes | sudo apt install gfortran 
RUN yes | sudo apt install gcc 
RUN yes | sudo apt install git 

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir ./home/llama.cpp_dir
COPY ./llama.cpp_dir ./home/llama.cpp_dir

WORKDIR /home/llama.cpp_dir
RUN make

WORKDIR /
RUN yes | sudo apt-get install build-essential cmake git libjson-c-dev libwebsockets-dev
RUN git clone https://github.com/tsl0922/ttyd.git
RUN cd ttyd && mkdir build && cd build
WORKDIR /ttyd/build
RUN cmake ..
RUN make && make install 

RUN yes | sudo apt install curl 

WORKDIR /

COPY ./start_program.sh /home/llama.cpp_dir 
WORKDIR /home/llama.cpp_dir 
RUN chmod 555 start_program.sh 

WORKDIR /
COPY ./prompts/ /home/llama.cpp_dir/prompts

EXPOSE 7681

WORKDIR /home/llama.cpp_dir


CMD ttyd --writable bash -c "./start_program.sh"
