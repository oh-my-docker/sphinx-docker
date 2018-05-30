FROM python:3.6.5-alpine

LABEL maintainer="Peng Xiao <xiaoquwl@gmail.com>"

RUN apk add --update make && pip install sphinx

WORKDIR /app

VOLUME ["/app"]

CMD []
