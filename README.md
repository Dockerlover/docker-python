# docker-python
Docker化Python

## 镜像特点

- 2015/6/20 继承基础镜像docker-ubuntu

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-python.git
        cd docker-python
        docker build -t docker-python .

- 运行容器

        docker run -it -d --name python  docker-python

- 进入容器

        docker exec -it python /bin/bash

- 使用镜像部署python应用

        git clone xxx.git
        cd xxx
        docker run -it -d -v /web/path:/code --name myweb docker-python

- 注意事项
        
当然你同样需要编写supervisord.conf，类似这样：

        [supervisord]

        nodaemon=true
        
        [program:myweb]
        
        command=/usr/bin/python xxx.py
        

