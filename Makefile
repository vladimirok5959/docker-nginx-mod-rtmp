VERSION="1.0.0"

docker-build:
	@-docker rmi docker-nginx-mod-rtmp:latest
	docker build -t docker-nginx-mod-rtmp:latest ./

docker-export:
	@-rm ./build/docker-nginx-mod-rtmp.tar
	docker save docker-nginx-mod-rtmp:latest > ./build/docker-nginx-mod-rtmp.tar

docker-import:
	@-docker rmi docker-nginx-mod-rtmp:latest
	docker load < ./build/docker-nginx-mod-rtmp.tar

docker-test:
	docker run --rm \
		--network host \
		--name docker-nginx-mod-rtmp-test \
		-v /etc/timezone:/etc/timezone:ro \
		-it docker-nginx-mod-rtmp:latest

docker-push:
	docker tag docker-nginx-mod-rtmp:latest vladimirok5959/nginx-mod-rtmp:${VERSION}
	docker tag docker-nginx-mod-rtmp vladimirok5959/nginx-mod-rtmp:latest
	docker login
	docker push vladimirok5959/nginx-mod-rtmp:${VERSION}
	docker push vladimirok5959/nginx-mod-rtmp:latest
	docker rmi vladimirok5959/nginx-mod-rtmp:${VERSION}
	docker rmi vladimirok5959/nginx-mod-rtmp:latest
	docker rmi docker-nginx-mod-rtmp:latest
