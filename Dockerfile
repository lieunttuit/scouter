FROM ruby:2.7.6
RUN sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker-key.asc \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker-key.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
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

