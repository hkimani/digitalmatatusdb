FROM mongo

WORKDIR /app

COPY ./auth.sh /app/auth.sh

RUN chmod +x /app/auth.sh

CMD ["/app/auth.sh"]