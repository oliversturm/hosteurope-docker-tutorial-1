build-docker:
	sudo docker build -f DotNetApp.Dockerfile -t dotnetapp .
	sudo docker build -f NodeApp.Dockerfile -t nodeapp .

test-run-dotnetapp:
	sudo docker run --rm -it -p 80:80 dotnetapp

test-call-dotnetapp:
	curl 'http://localhost/calculate?calcType=add&x=10&y=20'

test-call-nginx-dotnetapp:
	curl 'http://localhost/dotnetservices/calculate?calcType=add&x=10&y=20'

run-dotnet-dev:
	sudo docker-compose -f docker-compose.dotnet.dev.yml up

run-dev:
	sudo docker-compose -f docker-compose.dev.yml up
