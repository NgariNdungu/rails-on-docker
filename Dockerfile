# run app as deploy user
# check Gemfile and install gems if changed
FROM ruby:latest
RUN apt-get update \
      && apt-get install -y --no-install-recommends nodejs \
      && rm -rf /var/lib/apt/lists/*
RUN adduser deploy --gecos '' --disabled-password
USER deploy
RUN gem install rails --version '~> 5.2' --no-document
WORKDIR /home/deploy/app
EXPOSE 3000
CMD ["/bin/bash", "entrypoint.sh"]
