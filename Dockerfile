FROM nginx:alpine

# 安装 envsubst 命令行工具，用于处理环境变量替换
RUN apk add --no-cache gettext

# 将 Nginx 配置模板复制到容器中
COPY nginx.conf.template /etc/nginx/templates/nginx.conf.template

# 使用环境变量替换配置文件中的变量，并重启 Nginx
CMD envsubst '$PROXY_TO' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
