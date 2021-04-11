FROM python:alpine3.7
WORKDIR /app


# We copy just the requirements.txt first to leverage Docker cache
pip install --upgrade pip
COPY requirements.txt .
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 5001
COPY . /app
RUN ["chmod", "+x", "app.py"]
CMD ["gunicorn", "--bind", "0.0.0.0:5001", "app:app"]


ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
