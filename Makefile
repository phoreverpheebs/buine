MAKEFLAGS += --silent
BIN_DIR = bin/
EXE = buine
OUT = $(BIN_DIR)$(EXE)

.PHONY: all
all: $(OUT)

$(BIN_DIR)$(EXE): $(EXE).hex $(BIN_DIR)
	cut -d'#' -f1 < $< | xxd -p -r > ./$@
	chmod +x $@
	
$(BIN_DIR):
	-mkdir -p bin

run: $(OUT)
	./$(OUT)

clean: $(BIN_DIR)
	rm -rf $<
