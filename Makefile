IMAGE_TAG="67407e53ac7f"

build:
	docker build .

run:
	docker run --name crypto-algo-notebook -p 8888:8888 -v "`pwd`/notebooks":/home/jovyan/ ${IMAGE_TAG}

login:
	docker exec -it crypto-algo-notebook bash