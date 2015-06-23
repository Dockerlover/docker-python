# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID python
# 安装python环境依赖包
RUN apt-get -y install python-dev python-requests python-pip 
RUN pip install --upgrade pip
# 创建代码路径
RUN mkdir -p /code
VOLUME ["/code","/var/log/supervisor"]
WORKDIR /code
# 安装依赖包
COPY requirements.txt requirements.txt
RUN  pip install -r requirements.txt
# 默认暴露80端口
EXPOSE 80
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
