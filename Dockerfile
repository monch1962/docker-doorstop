FROM python:3.10-bullseye
ENV LAST_UPDATED 2021-10-11
ENV EDITOR nano

RUN apt-get update \
    && apt-get install -y --no-install-recommends nano git vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#COPY doorhole.py .

WORKDIR /data

EXPOSE 7867
ENTRYPOINT ["/bin/bash"]
