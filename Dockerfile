FROM golang:alpine as app-builder
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go install -ldflags '-extldflags "-static"'

FROM scratch
COPY --from=app-builder /go/bin/go_code_education_rocks /go_code_education_rocks
ENTRYPOINT ["/go_code_education_rocks"]