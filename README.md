# Boilerplate

Python project boilerplate.


### Auto installation

For Linux and Mac use make:

    make install

## Manual installation

Use [poetry](https://python-poetry.org):

    poetry install

Use [pre-commit](https://pre-commit.com/#install):

Install the git hook scripts:

    pre-commit install
    
## Code style with pre-commit

To manually run all pre-commit hooks on a repository:

    pre-commit run --all-files

To manually run all pre-commit hooks on specific files:

    pre-commit run --files src/application/main.py

To run individual hooks:

    pre-commit run <hook_id>

Code style:

    pre-commit run flake8

Type check:

    pre-commit run mypy
