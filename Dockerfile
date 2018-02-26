FROM ruby:2.4.3

RUN apt-get update && apt-get install -y postgresql-client

WORKDIR /tmp
COPY Gemfile* ./
RUN bundle install

WORKDIR /app
COPY . .

ARG WAIT_FOR_POSTGRES=false
ARG PREPARE_DATABASE=false

ENV WAIT_FOR_POSTGRES=$WAIT_FOR_POSTGRES PREPARE_DATABASE=$PREPARE_DATABASE
ENV POSTGRES_HOST=localhost POSTGRES_USER=web_app POSTGRES_PASSWORD=

EXPOSE 9292

ENTRYPOINT ["/app/bin/docker-entrypoint.sh"]
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]
