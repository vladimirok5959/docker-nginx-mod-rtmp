# docker-nginx-mod-rtmp

Docker base image with Nginx + libnginx-mod-rtmp + ffmpeg. Streaming proxy. Allow you to stream video to multiple streaming platform and keep recordings in original quality. Time zone can be binded at container startup from host machine by `-v /etc/timezone:/etc/timezone:ro`. Default server port is `8999`. Video recordings here: `http://127.0.0.1:8999/recordings/`

Docker image: [https://hub.docker.com/r/vladimirok5959/nginx-mod-rtmp](https://hub.docker.com/r/vladimirok5959/nginx-mod-rtmp)

## Makefile

* **make docker-build** - build docker image
* **make docker-export** - export docker image to file
* **make docker-import** - import docker image from file
* **make docker-test** - run test container
* **make docker-push** - push image to docker hub

## Running docker container

```sh
docker run -d \
    --network host \
    --restart=always \
    --name my-container-name \
    -v /etc/timezone:/etc/timezone:ro \
    -v /var/docker/restream/recordings:/var/www/html/recordings \
    -v /var/docker/restream/rtmp-pwd.conf:/etc/nginx/rtmp-pwd.conf \
    -v /var/docker/restream/rtmp-recordings.conf:/etc/nginx/rtmp-recordings.conf \
    -v /var/docker/restream/rtmp-twitch.conf:/etc/nginx/rtmp-twitch.conf \
    -v /var/docker/restream/rtmp-youtube.conf:/etc/nginx/rtmp-youtube.conf \
    vladimirok5959/nginx-mod-rtmp:latest
```

```txt
Server: rtmp://127.0.0.1/live
Stream Key: stream?pwd=my-secret-password-here
```
