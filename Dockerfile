FROM python:3.6.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app

RUN apt-get update && \
    pip install --upgrade pip && pip install -r requirements.txt

COPY . /usr/src/app

EXPOSE 5000

CMD ["python", "./main.py" ]
