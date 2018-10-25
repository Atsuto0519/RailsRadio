# RailsRadio
Ruby on Railsを使ってラジオ英会話をどこでも学べるようにした

# Usage

Cloneしたあとは，基本的に以下でOK.

```sh
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

### SSL認証周り

以下を参考に改変すると良い．

Pumaサーバで動作するように調整済み．

- [Rails5 + pumaのローカル環境でSSL/HTTPSを有効にする](https://qiita.com/zaru/items/ccf328e87c768168134d)
