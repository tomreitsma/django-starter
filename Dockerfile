# syntax=docker/dockerfile:1
FROM python:3.11-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH "${PATH}:/home/web/.local/bin/"

RUN useradd -ms /bin/bash web

RUN mkdir /app /scripts /static_files /media_files

WORKDIR /app

RUN apt-get --yes update \
    && apt-get --yes upgrade \
    && apt-get install -y -q --no-install-recommends \
    libpq-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libffi-dev \
    build-essential \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

COPY ./src/requirements.txt /app
COPY ./scripts/docker /scripts

RUN chmod +x /scripts/wait-for-db.sh
RUN chown -R web:web /app /scripts /static_files /media_files
RUN chmod 755 /static_files /media_files

ENV DJANGO_STATIC_ROOT=/static_files
ENV DJANGO_MEDIA_ROOT=/media_files

ADD ./src /app

USER web
RUN pip install --user -r requirements.txt

FROM base AS development

COPY ./src/requirements-dev.txt /app
RUN pip install --user -r requirements-dev.txt

CMD ["bash", "/scripts/start-dev-server.sh"]

FROM base AS prod
CMD ["bash", "/scripts/start-prod-server.sh"]
