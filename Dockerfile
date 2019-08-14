FROM ruby:2.3.1
# RUN apt-get update -qq && \
#   apt-get install -y nodejs npm && \
#   npm install -g n && \
#   n stable && \
#   apt-get purge -y nodejs npm && \
#   apt-get autoremove -y && \
#   gem install bundler -v 1.16.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && \
  gem install bundler

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get install nodejs

# WORKDIR /tmp
# ADD ./remote_controller/Gemfile Gemfile
# ADD ./remote_controller/Gemfile.lock Gemfile.lock
# RUN bundle install

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
# ADD ./remote_controller ${APP_HOME}
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install
ADD . ${APP_HOME}