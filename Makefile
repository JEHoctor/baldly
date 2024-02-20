.PHONY: init clean update format lint lint-fix test type-check quality

init:
	python3.12 -m venv venv
	(source venv/bin/activate && pip install -e . -r requirements.txt)
	(source venv/bin/activate && pre-commit install)

clean:
	rm -rf venv/

update: clean init

format:
	(source venv/bin/activate && ruff format src/ tests/)

lint:
	(source venv/bin/activate && ruff src/ tests/)

lint-fix:
	(source venv/bin/activate && ruff --fix src/ tests/)

test:
	(source venv/bin/activate && pytest tests/)

type-check:
	(source venv/bin/activate && pyright --help)

quality: format lint test
