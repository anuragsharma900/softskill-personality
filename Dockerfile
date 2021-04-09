FROM ubuntu:latest

MAINTAINER Your Name "anurag_sharma9009@yahoo.com"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev 
RUN /usr/bin/pip install --upgrade pip
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["python3"]

CMD ["app.py"]