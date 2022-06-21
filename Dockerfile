FROM ruby:2.7.6
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu focal stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
  && apt-get update -qq \
  && apt-get install -y build-essential libpq-dev nodejs yarn postgresql-client

WORKDIR /scouter

COPY Gemfile /scouter/Gemfile
COPY Gemfile.lock /scouter/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN bundle config set with production
RUN bundle config set without test development

RUN mkdir -p tmp/sockets

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

