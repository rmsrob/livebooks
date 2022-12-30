ifneq (,$(wildcard ./.env))
    include .env
    export
endif

export REPO="${PWD}"

cmd-exists-%: ## check if you got the cli tools to run commandes
	@hash $(*) > /dev/null 2>&1 || \
		(echo "ERROR: '$(*)' must be installed and available on your PATH."; exit 1)

.PHONY: dcn
dcn: cmd-exists-docker
	docker network create livebook-runner