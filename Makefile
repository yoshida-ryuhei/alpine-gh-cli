.PHONY: build_container
build_container:
	docker buildx build . --build-arg="ALPINE_VERSION=$(shell cat alpine_version)" --build-arg="GH_CLI_VERSION=$(shell cat gh_cli_version)" --tag ghcr.io/yoshida-ryuhei/alpine-gh-cli:latest

.PHONY: install_pre_commit
install_pre_commit:
	pre-commit install
