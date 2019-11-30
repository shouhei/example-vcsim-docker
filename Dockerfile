FROM golang:latest as build-env
RUN go get -u github.com/vmware/govmomi/vcsim && cd /go/src/github.com/vmware/govmomi/vcsim && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-s -w" -o vcsim main.go

FROM scratch
COPY --from=build-env /go/src/github.com/vmware/govmomi/vcsim/vcsim /vcsim
COPY --from=build-env /tmp /tmp
ENTRYPOINT ["/vcsim"]
