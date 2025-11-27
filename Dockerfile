FROM python:3.10-slim-buster

WORKDIR /app

RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    git gcc python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /app
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "main.py"]
