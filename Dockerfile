FROM python:3.10-bullseye
ENV LAST_UPDATED 2021-10-13
ENV EDITOR nano

RUN apt-get update \
    && apt-get install -y --no-install-recommends nano git vim wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# yq comes in very handy if/when you want to manipulate Doorstop's YAML data files
ENV YQ_VERSION=v4.13.4
ENV YQ_BINARY=yq_linux_amd64
RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/${YQ_BINARY} -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#COPY doorhole.py .
COPY doorstop-validator /usr/local/bin/
COPY doorstop-reporter /usr/local/bin/

WORKDIR /data
EXPOSE 7867
ENTRYPOINT ["/bin/bash"]
