MAKEFLAGS += --silent

build: buine.hex
	@mkdir -p bin
	cut -d'#' -f1 <buine.hex | xxd -p -r > ./bin/buine
	chmod +x ./bin/buine

run: build
	./bin/buine

bin/buine: build

clean: bin/
	rm -rf bin/
