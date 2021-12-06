FROM python:3.9-slim

ENV PYTHONUNBUFFERED 1

RUN python -m pip install --upgrade pip

COPY ./app/requirements.txt  /requirements.txt
RUN python -m pip install -r requirements.txt

RUN mkdir /app
COPY ./app /app
WORKDIR /app

# collect static files
# RUN python manage.py collectstatic --noinput

# run migrate db
# RUN python manage.py migrate

CMD gunicorn app.wsgi:application --bind 0.0.0.0:$PORT
