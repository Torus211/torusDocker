
FROM python:3.9-slim as builder

RUN apt-get update && apt-get install -y --no-install-recommends git


WORKDIR /app
RUN git clone https://github.com/Torus211/7.git .


RUN pip install --no-cache-dir -r requirements.txt


FROM python:3.9-slim


WORKDIR /app
COPY --from=builder /app /app


RUN pip install --no-cache-dir -r requirements.txt --no-deps


CMD ["python", "app.py"]
