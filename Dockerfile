FROM docker.io/library/python:3.8.0-alpine3.10@sha256:7f465d82a49e092b609fa97cea8ea761c9aa4fa6cab05f4876150e28bf16bcc3
# Python docker images: https://github.com/docker-library/docs/tree/master/python/

USER root

# Copy the src
WORKDIR /app
COPY src/ /app/src/
COPY ./requirements.txt /app
RUN ls -la /app

# Install python dependencies
RUN python3 --version
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r /app/requirements.txt
RUN pip3 list --format=columns

USER 1001

# EXPOSE 5001
ENTRYPOINT ["python3", "/app/src/app.py"]
