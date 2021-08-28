# 1st Stage -Build a API Project-
FROM gradle:7.2-jdk8 AS builder
WORKDIR /home/shirasunakondatev4
COPY protos/ ./protos
COPY server ./server
WORKDIR /home/shirasunakondatev4/server
RUN gradle installDist

# 2nd Stage -Buid a production image-
FROM openjdk:8-jdk-slim AS api
COPY --from=builder /home/shirasunakondatev4/server/api/build/install/api /home
