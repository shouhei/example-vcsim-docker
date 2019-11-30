.PHONY: run stop status
build: Dockerfile
	docker build . -t vcsim:latest

run:
	docker run --name vcsim -p 127.0.0.1:443:8989 -d vcsim:latest -l 0.0.0.0:8989

status:
	docker ps -a | grep vcsim

stop:
	docker stop vcsim && docker rm vcsim
