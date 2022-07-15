FROM nickblah/lua:latest

RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get install -y python3 python3-pip sudo unzip wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR "/"
COPY ./app /app

RUN wget https://luarocks.org/releases/luarocks-3.9.1.tar.gz
RUN tar zxpf luarocks-3.9.1.tar.gz
WORKDIR "/luarocks-3.9.1"
RUN ./configure && make && sudo make install
WORKDIR "/"
RUN pip3 install flask
RUN luarocks install --global lua-cjson 2.1.0-1
RUN luarocks install --global bit32

EXPOSE 5000

WORKDIR "/midealua"
ENTRYPOINT [ "python3", "/app/transapi.py" ]