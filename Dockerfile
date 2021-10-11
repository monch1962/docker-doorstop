#Download base image ubuntu 16.10
#FROM ubuntu:16.10
FROM python:3.10-bullseye

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /data

ENTRYPOINT ["/bin/bash"]
