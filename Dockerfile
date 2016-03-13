FROM alpine

RUN apk update && apk add go

ADD https://github.com/walter-cd/walter/releases/download/v1.3.0/walter_1.3.0_linux_amd64.tar.gz /tmp/walter.tar.gz
RUN gunzip -c /tmp/walter.tar.gz > /tmp/walter.tar && \
	tar -C /tmp -xvf /tmp/walter.tar && \
	cp /tmp/walter_linux_amd64/walter /bin/walter && \
	chmod a+x /bin/walter && \
	rm -rf /tmp/walter_linux_amd64 /tmp/walter.tar /tmp/walter.tar.gz

CMD ["/bin/walter"]
