# FROM代表此次构建的镜像以哪个镜像为基础
FROM python:3.6-alpine
# COPY是拷贝宿主机文件到镜像中的命令，这里需要注意，COPY的两个参数需要同时是文件夹或者文件
COPY ./fapp /code
# RUN则是在镜像中执行命令
RUN ls /code
# 切换工作目录，便于执行其他命令
WORKDIR /code
# 安装启动web服务需要的依赖
RUN pip install redis flask
# CMD代表镜像启动后默认执行的命令，这里要注意CMD打上中括号等同于exec执行命令
# 不打中括号等同于 sh -c 执行命令
CMD ["python","app.py"]
