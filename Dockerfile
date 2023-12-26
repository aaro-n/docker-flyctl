# 使用轻量的基础镜像
FROM debian:latest

# 设置环境变量
ENV FLYCTL_INSTALL="/root/.fly"
ENV PATH="$FLYCTL_INSTALL/bin:$PATH"

# 安装依赖项并清理缓存
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L https://fly.io/install.sh | sh && \
    rm -rf /var/lib/apt/lists/*

# 添加一个命令，使容器保持运行
CMD ["tail", "-f", "/dev/null"]

