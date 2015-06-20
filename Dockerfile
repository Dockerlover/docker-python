# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 安装python环境依赖包
RUN apt-get -y install python-dev python-pip
# 创建代码路径
RUN mkdir -p /code
VOLUME ["/code","/var/log/supervisor"]
WORKDIR /code

# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
