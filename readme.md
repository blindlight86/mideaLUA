# Midea LUA Online Transcoder
Usage:
```
version: '3.3'
services:
  midealua:
    container_name: midealua
    image: blindlight/midealua
    restart: unless-stopped
    volumes:
      - ./midealua:/midealua # where you store decrypted lua files
    ports:
      - "5000:5000"
```
http://ip:5000 shows post data detials 