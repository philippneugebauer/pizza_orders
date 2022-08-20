FROM ruby:3.1

RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client libvips42 && \
    apt-get autoremove && \
    apt-get clean &&  \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir /pizzas
WORKDIR /pizzas
COPY Gemfile /pizzas/Gemfile
COPY Gemfile.lock /pizzas/Gemfile.lock
RUN bundle install

COPY --chown=daemon . /pizzas

EXPOSE 3000

USER daemon

RUN chmod +x docker_start.sh
CMD ["bash", "/pizzas/docker_start.sh"]