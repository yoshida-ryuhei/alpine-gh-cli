.PHONY: build_container
build_container:
	docker buildx build . --tag ghcr.io/yoshida-ryuhei/alpine-gh-cli:latest

.PHONY: install_pre_commit
install_pre_commit:
	pre-commit install
