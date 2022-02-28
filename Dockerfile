FROM golang:1.17.7-bullseye AS build-env
WORKDIR /go/src/ssosync
RUN git clone https://github.com/awslabs/ssosync.git /go/src/ssosync \
    && make go-build

FROM gcr.io/distroless/base-debian11
COPY --from=build-env /go/src/ssosync/ssosync /
ENTRYPOINT [ "/ssosync" ]
