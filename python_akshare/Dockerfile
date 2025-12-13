ARG PY_BASE_IMAGE=python:3.10-slim
FROM ${PY_BASE_IMAGE}

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TZ=Asia/Shanghai

RUN pip install --no-cache-dir --timeout 120 fastapi uvicorn akshare pandas lxml requests aiohttp

WORKDIR /app

COPY main.py /app/main.py
COPY routes /app/routes

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
