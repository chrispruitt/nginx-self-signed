build:
	docker build -t nginx-self-signed .

run: build
	docker run -it --rm \
	-p 8080:8080 \
	-p 8443:8443 \
	nginx-self-signed

test:
	# Expect: Invalid cert.
	curl https://localhost:8443

test-success:
	# Expect: 200 hello world
	curl --insecure https://localhost:8443