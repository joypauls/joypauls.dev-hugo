.PHONY: update
update:
	@echo "Updating submodules"
	git submodule update --init --recursive
	@echo "Updating submodules done"

.PHONY: dev
dev:
	hugo server -D --port 63824

.PHONY: run
run:
	hugo --gc --minify

