# SKondatePY Image
## 1st
FROM python:3.7.11-slim AS skondatepy
COPY skondatepy /home
COPY skondatepy/data /srv
ENV SK_SAVE_DIR /srv
RUN cd /home && \
        apt update -y && \
        apt install -y busybox-static && \
        pip install -r requirements.txt && \
        python src/initialize.py

# API Image
## 1st
FROM gradle:7.2-jdk8 AS builder
WORKDIR /home/shirasunakondatev4
COPY protos/ ./protos
COPY server ./server
WORKDIR /home/shirasunakondatev4/server
RUN gradle installDist

## 2nd
FROM openjdk:8-jdk-slim AS api
COPY --from=builder /home/shirasunakondatev4/server/api/build/install/api /home
