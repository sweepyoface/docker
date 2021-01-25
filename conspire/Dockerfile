FROM golang:alpine as build

WORKDIR /build

RUN apk add --no-cache git

RUN git clone https://github.com/sweepyoface/conspire.git
RUN cd conspire && go build -o conspire cmd/server.go

FROM alpine

WORKDIR /app

COPY --from=build /build/conspire/conspire .
COPY --from=build /build/conspire/static ./static

RUN chmod +x conspire

CMD [ "./conspire" ]
