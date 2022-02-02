setup:
	sudo apt-get update
	docker-compose build
	docker-compose up

run:
	docker-compose up
