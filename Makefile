.PHONY: docs clean build

install:
	poetry install

test:
	poetry run py.test --cov=aftership

record:
	poetry run py.test --vcr-record=new_episodes

lint:
	poetry run pre-commit run --all-files --show-diff-on-failure
	poetry run pre-commit run gitlint --hook-stage commit-msg --commit-msg-filename .git/COMMIT_EDITMSG

docs:
	cd docs && make html
	@echo "\033[95m\n\nBuild successful! View the docs homepage at docs/_build/html/index.html.\n\033[0m"

coveralls:
	poetry run coveralls

build:
	poetry build

clean:
	-rm -r docs/_build
	-rm -r build dist aftership.egg-info
