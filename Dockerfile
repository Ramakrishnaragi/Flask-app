FROM python:3.11-slim

WORKDIR /app

COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY app /app

ENV PORT=5000
EXPOSE 5000

# create non-root user
RUN useradd -m appuser
USER appuser

CMD ["python", "main.py"]

