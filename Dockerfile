FROM stashapp/stash:latest
SHELL ["/bin/sh", "-lc"]

# 只用 apk 装 python + pip（以及证书，避免 TLS 问题）
RUN set -eux; \
    apk update; \
    apk add --no-cache ca-certificates python3 py3-pip; \
    update-ca-certificates; \
    python3 -m pip install --no-cache-dir -U pip setuptools wheel

# 其余全部用 pip 装（避免 apk 包名/仓库差异）
# Alpine PEP668: 需要 --break-system-packages
RUN python3 -m pip install --no-cache-dir --break-system-packages \
      "stashapp-tools>=0.2.50" \
      "requests" \
      "watchdog" \
      "schedule" \
      "pyyaml"
