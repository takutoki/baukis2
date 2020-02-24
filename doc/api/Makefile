DEST = index.html
SRC = openapi.yaml
REDOC_CLI = node_modules/.bin/redoc-cli

default: build

build: $(DEST)

$(REDOC_CLI):
	npm install

$(DEST): $(REDOC_CLI) $(SRC)
	$(REDOC_CLI) bundle $(SRC) -o $@

clean:
	rm -f $(DEST)

clean-all: clean
	rm -rf node_modules

open: $(DEST)
	open $<
