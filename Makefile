IMAGE_TAG="crypto-algo-notebook-image"

build:
	docker build -t ${IMAGE_TAG} .

run:
	docker run --name crypto-algo-notebook -p 8888:8888 -v "`pwd`/notebooks":/home/jovyan/ ${IMAGE_TAG}

login:
	docker exec -it crypto-algo-notebook bash