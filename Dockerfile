from ruby:2.7-alpine

RUN apk update
RUN apk add libexif-dev
RUN apk add build-base
RUN apk add sqlite-dev
RUN apk add tzdata
RUN apk add postgresql-dev
COPY . /app
WORKDIR /app
RUN bundle
RUN rake db:migrate
RUN rake spec

EXPOSE 3000

CMD rails s -b 0.0.0.0
