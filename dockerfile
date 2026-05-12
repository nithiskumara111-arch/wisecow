FROM ubuntu:latest
RUN apt-get update && apt-get install -y fortune-mod cowsay netcat-openbsd && rm -rf /var/lib/apt/lists/*
COPY wisecow.sh /wisecow.sh
RUN chmod +x /wisecow.sh
EXPOSE 4499
CMD ["/wisecow.sh"]
