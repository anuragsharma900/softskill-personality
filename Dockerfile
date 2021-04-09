FROM ubuntu:16.04

MAINTAINER Your Name "anurag_sharma9009@yahoo.com"

RUN apt-get update -y && \
    apt-get install -y python3.7.6

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]