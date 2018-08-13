FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential nodejs libpq-dev vim imagemagick
RUN mkdir /porpos
WORKDIR /porpos
COPY Gemfile /porpos/Gemfile
COPY Gemfile.lock /porpos/Gemfile.lock
RUN bundle install
COPY . /porpos
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
