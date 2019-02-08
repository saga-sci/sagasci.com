SHELL := /bin/bash

OS := $(shell uname -s)

DEVICE=cpu

default: serve


venv:
	@test -d .venv || python3.12 -m venv .venv
	@. .venv/bin/activate && \
	pip install --upgrade pip && \
	pip install -r requirements.txt

install: venv

fix:


serve: fix
	@echo "Starting HTTP server at http://localhost:8000"
	@source .venv/bin/activate; \
	PYTHONPATH=. python -m http.server 8000 --directory docs