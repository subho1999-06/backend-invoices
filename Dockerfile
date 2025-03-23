FROM python:3.10.11

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Make sure the port matches what Cloud Run expects
CMD exec uvicorn main:app --host 0.0.0.0 --port ${PORT:-8080}