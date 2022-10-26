FROM python:3.10
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY .env /app/.env
COPY scripts/docker-entrypoint.sh /app/docker-entrypoint.sh
COPY scripts/wait-for-it.sh /app/wait-for-it.sh
RUN chmod +x /app/docker-entrypoint.sh /app/wait-for-it.sh

ADD src/ /app

CMD ["bash", "/app/docker-entrypoint.sh"]

