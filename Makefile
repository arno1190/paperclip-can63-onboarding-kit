.PHONY: pdf clean all

all: pdf

pdf:
	@chmod +x build/build.sh
	@./build/build.sh

clean:
	rm -rf dist
