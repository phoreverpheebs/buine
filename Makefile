MAKEFLAGS += --silent

build: quine.hex
	cut -d'#' -f1 <quine.hex | xxd -p -r > ./bin/quine
	chmod +x ./bin/quine

run: bin/quine
	./bin/quine

bin/quine: build
