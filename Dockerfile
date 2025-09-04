FROM python:alpine
RUN pip install aktools
ENTRYPOINT ["python", "-m", "aktools", "--host", "0.0.0.0"]
