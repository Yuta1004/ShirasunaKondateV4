IMAGE := protoc_dart:latest
PROTOC_DIR := $(CURDIR)/../protos
OUTPUT_DIR := $(CURDIR)/lib/grpc

buildImage:
	docker build -t $(IMAGE) .

generateProto:
	docker run -v $(PROTOC_DIR):/home/protos -v $(OUTPUT_DIR):/home/generated --rm $(IMAGE) \
		/bin/bash -c "protoc --dart_out=grpc:/home/generated -I/home/protos /home/protos/*.proto /home/protos/**/*.proto"
