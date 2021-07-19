FROM python:2.7-alpine as base

FROM base as builder
COPY requirements.txt .
RUN pip install --install-option="--prefix=/install" -r requirements.txt

FROM base
COPY --from=builder /install /usr/local
WORKDIR /app
COPY . .

CMD [ "python", "runserver.py" ]
