FROM alpine:latest
MAINTAINER dingdayu 614422099@qq.com

# 更换国内镜像
RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main' > /etc/apk/repositories
RUN echo '@community http://mirrors.aliyun.com/alpine/latest-stable/community' >> /etc/apk/repositories
RUN echo '@testing http://mirrors.aliyun.com/alpine/edge/testing' >> /etc/apk/repositories

RUN apk update && apk upgrade

# 时区配置
ENV TIMEZONE Asia/Shanghai
RUN apk add tzdata
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN echo $TIMEZONE > /etc/timezone

# 容器命令执行
CMD ["sh"]
