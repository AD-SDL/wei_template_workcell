FROM python:3.11

COPY ./example_app /example_app

RUN pip install -e ./example_app

CMD ["python3", "-m", "/example_app/example_app.py"]
