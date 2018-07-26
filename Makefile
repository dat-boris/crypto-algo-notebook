IMAGE_TAG="crypto-algo-notebook-image"
CONTAINER_TAG="crypto-algo-notebook"

build:
	docker build -t ${IMAGE_TAG} .

run:
	docker run --name ${CONTAINER_TAG} -p 8888:8888 -v "`pwd`/notebooks":/home/jovyan/ ${IMAGE_TAG} || \
		docker start -i ${CONTAINER_TAG} || \
		(echo "${CONTAINER_TAG} already running."; docker logs -f ${CONTAINER_TAG})

login:
	docker exec -it ${CONTAINER_TAG} bash\
