FROM python:3.11-slim

RUN apt update && \
    apt install -y wget gnupg lsb-release && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O- | apt-key add - && \
    apt update && apt install -y postgresql-client-16

WORKDIR /app

CMD sh -c "PGPASSWORD='MMExr6FJBH4QFfSGp1Ev3YgEY~HVbDE9' \
pg_dump -U railway -h postgres -d railway -F t -f n8n_backup.dump && python3 -m http.server 8080"
