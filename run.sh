HOST_IP=$(hostname --all-ip-addresses | awk '{print $1}')
docker run -it -d --name python -p 8080:80  docker-python
