FROM python:3.9-slim

ENV POETRY_VERSION=1.4.2 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TZ=UTC 

RUN pip install poetry==${POETRY_VERSION}  
RUN mkdir -p practice
COPY pyproject.toml ./
RUN poetry install
# RUN poetry run python -m ipykernel install --user --name ml_practice

COPY . /practice
WORKDIR /practice

CMD ["poetry", "run", "jupyter", "notebook"]