FROM raspbian/stretch

RUN wget https://dl.google.com/go/go1.10.2.linux-arm64.tar.gz
RUN sudo tar -C /usr/local -xzf go1.10.2.linux-arm64.tar.gz

ENV GOLANG_VERSION 1.10.2
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
# gcc for cgo
RUN apt-get update && apt-get install -y --no-install-recommends \
	libusb-dev libusb-1.0-0-dev \
	&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
RUN mkdir -p $GOPATH/src/github.com/payboxth/vending/host

WORKDIR $GOPATH/src/github.com/payboxth/vending/host
ENTRYPOINT ["sh"]