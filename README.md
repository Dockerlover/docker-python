# docker-python
Docker化Python

## 镜像特点

- 2015/6/20 继承基础镜像docker-ubuntu
- 2015/6/23 默认暴露80端口

## 直接pull镜像

    docker pull liuhong1happy/docker-python
    docker tag liuhong1happy/docker-python docker-python

## 获取代码并构建

    git clone https://github.com/Dockerlover/docker-python.git
    cd docker-python
    docker build -t docker-python .

## 运行容器[run.sh]

    docker run -it -d --name python -p 8080:80  docker-python

## 进入容器

    docker exec -it python /bin/bash

## 使用镜像部署python应用

    git clone xxx.git
    cd xxx
    docker run -it -d -v /web/path:/code -p 8080:80 --name myweb docker-python

## 自定义python开发环境

如果你需要继承该镜像，需要自己写dockerfile重新构建新的镜像：

    #继承docker-python镜像
    FROM docker-python
    # 安装依赖包
    COPY requirements.txt requirements.txt
    RUN  pip install -r requirements.txt
    # 默认暴露80端口
    EXPOSE 80
    # 配置supervisord
    COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
    # 启动supervisord
    CMD ["/usr/bin/supervisord"]

同样需要编写supervisord.conf，类似这样：

    [supervisord]

    [nodaemon=true
        
    [program:myweb]
        
    command=/usr/bin/python xxx.py 80
    
构建并运行里的代码

    docker build -t python-dev-base .
 
运行容器

    docker run -it -d --name python -p 8080:80  python-dev-base
