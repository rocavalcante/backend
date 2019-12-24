build:
	docker build -t container_back:1 .
test: 
	docker run -it --rm --name testing container_back:1
