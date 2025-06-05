build:
	docker buildx build --platform linux/arm64 -t audiowaveform-static-arm64 . --load

install:
	mkdir -p bin; \
	id=$$(docker create --platform linux/arm64 --name audiowaveform_artifact_container audiowaveform-static-arm64); \
	docker cp $$id:/audiowaveform/build/audiowaveform ./bin/audiowaveform; \
	docker rm -v $$id && echo \"Binary available in bin directory\" && exit 0

clean:
	docker rmi -f /audiowaveform-static-arm64