all: build release
build:
	docker build -t buildcurl/buildcurl .
release:
	docker push buildcurl/buildcurl

images: build_images push_images
build_images:
	cd targets && find . -name Dockerfile -print0 | xargs -0 -n1 -P 1 `pwd`/dockerize
push_images:
	cd targets && find . -name Dockerfile -print0 | xargs -0 -n1 -P 1 `pwd`/push
