# Get python base image
FROM python:3.13.9-alpine3.22
# Create or Move into /app directory
WORKDIR /app
# Copy src files to base /app directory
COPY ./src/ /app
# Update package manager, install python development dependencies.
# Upgrade pip and install other requirements
RUN apt-get update && apt-get install -y python3-dev python3-venv python3-pip && \
  python3 -m venv /opt/venv/ && \
  /opt/venv/bin/python -m pip install --upgrade pip && \
  /opt/venv/bin/python -m pip install -r requirements.txt
# Copy just the entrypoint to app
COPY ./conf/entrypoint.sh /app/entrypoint.sh
# make the entrypoint as executable by changing it mode.
RUN chmod +x /app/entrypoint.sh
# run just the entrypoint
CMD ["./entrypoint.sh"]
