README.md: $(wildcard */README.md)
	cat .github/readme-header.md $^ > $@
