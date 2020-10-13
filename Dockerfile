FROM ruby:2.6.6-alpine3.12

ENV APP_ROOT /usr/src/app
WORKDIR $APP_ROOT

ENV LANG C.UTF-8
ENV LANGUAGE=en_US:

RUN apk add --no-cache alpine-sdk

ENV CFLAGS="-Wno-cast-function-type"
ENV BUNDLE_FORCE_RUBY_PLATFORM=1

RUN gem install hako -v 2.13.0 \
  && gem install aws-sdk-s3 -v 1.60.1

WORKDIR $APP_ROOT

COPY . .

ENV PATH /usr/src/app/bin:$PATH

