# Dockerfile
FROM stashapp/stash:latest
SHELL ["/bin/sh", "-lc"]

# Alpine: 用 apk 装绝大多数依赖
RUN set -eux; \
    apk update; \
    apk add --no-cache \
      ca-certificates \
      python3 py3-pip \
      py3-requests py3-watchdog py3-yaml py3-schedule; \
    update-ca-certificates

# 只有 stashapp-tools 走 pip（PEP668 需要 --break-system-packages）
RUN python3 -m pip install --no-cache-dir --break-system-packages \
      "stashapp-tools>=0.2.50"
