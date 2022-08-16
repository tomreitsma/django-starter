FROM python:3.10

RUN mkdir /app
WORKDIR /app

RUN echo "wut"

COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt

ADD src/ /app

RUN chmod +x /app/docker/entrypoint.sh

CMD ["bash", "/app/docker/entrypoint.sh"]
