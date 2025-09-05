FROM python:alpine

RUN pip install aktools gunicorn

RUN set -ex && \
    PKG_NAME="aktools" && \
    PKG_LOCATION=$(pip show $PKG_NAME | grep "^Location:" | awk '{print $2}') && \
    PKG_PATH="$PKG_LOCATION/$PKG_NAME" && \
    ln -sf "$PKG_PATH" /app

WORKDIR /app

ENTRYPOINT ["gunicorn", "main:app", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8080"]
