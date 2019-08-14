FROM ruby:2.3.1
RUN gem install bundler -v 1.16.3
RUN bundler -v

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