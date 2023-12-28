.PHONY: build_container
build_container:
	docker buildx build . --build-arg="ALPINE_VERSION=$(shell cat alpine_version)" --build-arg="GH_CLI_VERSION=$(shell cat gh_cli_version)" --tag ghcr.io/yoshida-ryuhei/alpine-gh-cli:latest

.PHONY: test
test:
	docker run --rm -it ghcr.io/yoshida-ryuhei/alpine-gh-cli:latest gh help
	docker run --rm --env GH_TOKEN=$(shell cat .env) -it ghcr.io/yoshida-ryuhei/alpine-gh-cli:latest gh issue list -R yoshida-ryuhei/alpine-gh-cli
	docker run --rm --env GH_TOKEN=$(shell cat .env) -it ghcr.io/yoshida-ryuhei/alpine-gh-cli:latest gh pr list -R yoshida-ryuhei/alpine-gh-cli

.PHONY: install_pre_commit
install_pre_commit:
	pre-commit install

.PHONY: make_tag
make_tag:
	git tag -a "v$(shell cat alpine_version)-$(shell cat gh_cli_version)" -m "The version with alpine with v$(shell cat alpine_version) and gh_cli with v$(shell cat gh_cli_version)"
