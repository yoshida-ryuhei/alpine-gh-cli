.PHONY: build_container
build_container:
	docker buildx build . --build-arg="ALPINE_VERSION=$(shell cat alpine_version)" --build-arg="GH_CLI_VERSION=$(shell cat gh_cli_version)" --tag ghcr.io/yoshida-ryuhei/alpine-gh-cli:latest

.PHONY: install_pre_commit
install_pre_commit:
	pre-commit install

.PHONY: make_tag
make_tag:
	git tag -a "v$(shell cat alpine_version)-$(shell cat gh_cli_version)" -m "The version with alpine with v$(shell cat alpine_version) and gh_cli with v$(shell cat gh_cli_version)"
