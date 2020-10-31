SHELL:=/usr/bin/env bash

CURRENT_OS:=$(shell uname -s)
ifeq ($(CURRENT_OS), Linux)
	CURRENT_OS:=$(shell lsb_release -si)
endif

.PHONY: poetry
poetry:
	@echo "installing poetry"
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

.PHONY: pyenv
pyenv:
	@echo "installing pyenv"
    ifeq ($(CURRENT_OS),Ubuntu)
		curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    endif
    ifeq ($(CURRENT_OS),Darwin)
		brew install pyenv
    endif
	pyenv install 3.8.6

.PHONY: install
install: poetry pyenv
	pyenv local 3.8.6 && poetry env use $(pyenv which python)
	poetry install
	pre-commit install

.PHONY: clean
clean:
	@echo "Remove cached files."
	find . -name "*.py[co]" -o -name __pycache__ -exec rm -rf {} +
	find . -name ".pytest_cache" -exec rm -rf "{}" +
	find . -name \*.log -delete
	find . -name \*.coverage -delete
	rm -f src/media/*
	rm -rf *.egg-info
	rm -rf .mypy_cache
	rm -rf .tox

.PHONY: test
test: clean
	pytest src/tests
