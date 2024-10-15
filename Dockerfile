FROM python:3.10
WORKDIR /app
RUN python3 -m pip install radicale bcrypt

EXPOSE 5232
ENV RADICALE_USER=admin
ENV RADICALE_PASSWORD=admin

COPY config/users /app

CMD ["radicale", "--config", "/app/config/radicale.conf"]
