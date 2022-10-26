FROM python:3.10
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY .env ./.env

COPY requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt

COPY scripts/ /
RUN chmod +x /docker-entrypoint.sh /wait-for-it.sh


CMD ["bash", "/docker-entrypoint.sh"]

