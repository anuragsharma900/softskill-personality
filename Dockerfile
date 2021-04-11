FROM python:3
WORKDIR /usr/src/app

EXPOSE 5000

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev 

# We copy just the requirements.txt first to leverage Docker cache

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . /app
RUN ["chmod", "+x", "/app/app.py"]
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
CMD [ "/app/app.py" ]
