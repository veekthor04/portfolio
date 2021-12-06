FROM python:3.9-slim

ENV PYTHONUNBUFFERED 1

RUN python -m pip install --upgrade pip

COPY ./app/requirements.txt  /requirements.txt
RUN python -m pip install -r requirements.txt

RUN mkdir /app
COPY ./app /app
WORKDIR /app

COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

CMD ["entrypoint.sh"]
