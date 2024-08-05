# Use the official Python base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install any dependencies
RUN pip install uvicorn fastapi websockets httpx loguru diskcache apscheduler SQLAlchemy python-dateutil -i https://pypi.tuna.tsinghua.edu.cn/simple

# Copy the rest of the application code into the container
COPY sign.py .

# Expose the port the app runs on
EXPOSE 8081

# Run the script
CMD ["uvicorn", "sign:app", "--host", "0.0.0.0", "--port", "8081"]
