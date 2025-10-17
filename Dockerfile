FROM python:3.11-slim

WORKDIR /app

# Install dependencies
RUN pip install flask selenium requests

# Copy sync script
COPY server.py /app/server.py

EXPOSE 3210
CMD ["python", "-u", "/app/server.py"]
