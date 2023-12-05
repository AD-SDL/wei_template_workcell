FROM python:3.11

RUN mkdir -p /webcam_module

COPY ./example_app /example_app

RUN pip install ./example_app

CMD ["python", "/example_app/example_app.py"]
