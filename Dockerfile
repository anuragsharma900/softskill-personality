FROM python:3

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev 

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /usr/src/app

RUN pip install -r requirements.txt

COPY . /app


CMD ["python", "./app.py"]