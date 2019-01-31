# run app as deploy user
# check Gemfile and install gems if changed
FROM ruby:latest
RUN apt-get update \
      && apt-get install -y --no-install-recommends nodejs \
      && rm -rf /var/lib/apt/lists/*
RUN adduser deploy --gecos '' --disabled-password
USER deploy
RUN gem install rails --version '~> 5.2' --no-document
RUN mkdir /home/deploy/app
WORKDIR /home/deploy/app
COPY --chown=deploy . ./
RUN bundle install
EXPOSE 3000
ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
