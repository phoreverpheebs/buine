MAKEFLAGS += --silent

build: quine.hex
	@mkdir -p bin
	cut -d'#' -f1 <quine.hex | xxd -p -r > ./bin/quine
	chmod +x ./bin/quine

run: build
	./bin/quine

bin/quine: build

clean: bin/
	rm -rf bin/
