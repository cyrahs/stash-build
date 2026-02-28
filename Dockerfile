# Dockerfile
FROM stashapp/stash:latest

# 安装 Python + Alpine 里已有的 py3 包
RUN apk add --no-cache \
    python3 py3-pip \
    py3-requests py3-watchdog py3-yaml \
 && python3 -m pip install --no-cache-dir --upgrade pip

# 安装 PyPI 包（stashapp-tools 通常需要 pip）
# PEP668: Alpine 会阻止写系统 site-packages，所以这里必须 --break-system-packages
RUN python3 -m pip install --no-cache-dir --break-system-packages \
    "stashapp-tools>=0.2.50" \
    "schedule"
