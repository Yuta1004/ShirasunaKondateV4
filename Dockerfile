# SKondatePY Image
## 1st
FROM python:3.7.11-slim AS skondatepy
COPY skondatepy /home
COPY skondatepy/data /srv
COPY --chown=root:root cron.txt /var/spool/cron/crontabs/root
ENV SK_SAVE_DIR /srv
RUN cd /home && \
        apt update -y && \
        apt install -y busybox-static && \
        pip install -r requirements.txt && \
        python src/initialize.py

# API Image
## 1st (prepare caches for gradle)
FROM gradle:7.2-jdk8 AS cache
ENV GRADLE_USER_HOME /home/gradle/cache
RUN mkdir /home/gradle/project /home/gradle/project/api /home/gradle/project/stub
COPY server/settings.gradle.kts server/build.gradle.kts /home/gradle/project/
COPY server/api/build.gradle.kts /home/gradle/project/api
COPY server/stub/build.gradle.kts /home/gradle/project/stub
WORKDIR /home/gradle/project
RUN gradle clean build

## 2nd (build a project)
FROM gradle:7.2-jdk8 AS builder
WORKDIR /home/shirasunakondatev4
COPY --from=cache /home/gradle/cache /home/gradle/.gradle
COPY protos/ ./protos
COPY server ./server
WORKDIR /home/shirasunakondatev4/server
RUN gradle installDist

## 3rd (build a image)
FROM openjdk:8-jdk-slim AS api
COPY --from=builder /home/shirasunakondatev4/server/api/build/install/api /home
