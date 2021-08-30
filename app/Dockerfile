FROM dart:2.13-sdk
ENV PATH $PATH:/root/.pub-cache/bin
RUN apt update && \
        apt install -y protobuf-compiler &&\
        dart pub global activate protoc_plugin
