FROM python:latest
WORKDIR /app


# We copy just the requirements.txt first to leverage Docker cache

RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install scipy
RUN pip install scikit-learn

COPY requirements.txt .
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 5001
COPY . /app
RUN ["chmod", "+x", "app.py"]
CMD ["gunicorn", "--bind", "0.0.0.0:5001", "app:app"]


ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
