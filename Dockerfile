FROM python:2.7-slim

WORKDIR /app
COPY . .

# Install dependencies & utilities
RUN apt-get update --no-install-recommends \
    && apt-get install -y --upgrade libpq-dev
RUN pip install --no-cache-dir -r requirements.txt

# Do some cleanup
RUN apt-get clean \
    && apt autoremove -y \
    && rm -rfv /var/lib/apt/lists/*

CMD [ "python", "runserver.py" ]
