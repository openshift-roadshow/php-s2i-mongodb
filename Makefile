build:
	docker build -t osevg/php-s2i .
release: build
	docker push osevg/php-s2i:latest