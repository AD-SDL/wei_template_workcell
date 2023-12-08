FROM ghcr.io/ad-sdl/wei

COPY ./example_app /example_app

RUN pip install -e /example_app

CMD ["python3", "/example_app/example_app.py"]
