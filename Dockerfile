FROM ruby:2.5
# npmのインストール
RUN apt-get update && apt-get install -y nodejs postgresql-client npm
# yarnのインストール
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

WORKDIR /Railsapp1
COPY Gemfile /Railsapp1/Gemfile
COPY Gemfile.lock /Railsapp1/Gemfile.lock
RUN apt-get install\
            imagemagick
RUN yarn add bootstrap
RUN yarn add @popperjs/core
RUN bundle install

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]