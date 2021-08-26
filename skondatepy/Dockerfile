FROM python:3.7.11-slim

COPY requirements.txt /home
COPY src /home/src

# 新規で作成する場合は下2行をコメントアウト
COPY data/pdf /srv/pdf
COPY data/db /srv/db

VOLUME /srv

ENV SK_SAVE_DIR /srv
ENV PATH $PATH:/home/src

RUN echo "Step1. Setup python libs" && \
    cd /home && \
    pip install -r requirements.txt && \
    echo "Step2. Initialize dirs" && \
    python src/initialize.py && \
    echo "Step3. Setup tools" && \
    chmod +x /home/src/skondate.py && \
    chmod +x /home/src/settings.py
