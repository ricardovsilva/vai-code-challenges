from ruby:2.7-alpine

RUN apk update
RUN apk add libexif-dev
RUN apk add build-base
RUN apk add sqlite-dev
RUN apk add tzdata
COPY . /app
WORKDIR /app
RUN bundle

CMD rails s
