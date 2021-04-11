FROM python:3
WORKDIR /usr/src/app

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev 

# We copy just the requirements.txt first to leverage Docker cache

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . /app
RUN ["chmod", "+x", "/app/app.py"]
CMD [ "/app/app.py" ]
