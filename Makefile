.PHONY: build_container
build_container:
	docker buildx build . --tag alpine-gh-cli

.PHONY: install_pre_commit
install_pre_commit:
	pre-commit install
