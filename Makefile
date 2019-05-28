
binary = openapi-preprocessor
go = GO111MODULE=on go
version = $$(git describe --tags --always --dirty)

all: $(binary)

.PHONY: all test clean .FORCE

clean:
	rm -f $(binary)

version:
	@echo "$(version)"

$(binary): .FORCE
	@printf 'version: \033[1;33m%s\033[m\n' $(version)
	$(go) build -ldflags "-X main.version=@(#)$(version)" -o $@

test:
	$(go) test -v ./...