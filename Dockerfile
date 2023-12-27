# 使用轻量的基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /home/www

# 设置环境变量
ENV FLYCTL_INSTALL="/root/.fly"
ENV PATH="$FLYCTL_INSTALL/bin:$PATH"

# 安装依赖项并清理缓存
RUN apk update && \
    apk add --no-cache curl && \
    curl -L https://fly.io/install.sh | sh && \
    rm -rf /var/cache/apk/*

# 添加一个命令，使容器保持运行
CMD ["tail", "-f", "/dev/null"]

