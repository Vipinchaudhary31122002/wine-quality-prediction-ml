FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1
ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app

COPY .python-version pyproject.toml uv.lock ./

RUN pip install --upgrade pip
RUN pip install uv
RUN uv sync --frozen

COPY . .

EXPOSE 8000