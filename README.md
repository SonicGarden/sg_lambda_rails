# SG Lambda Rails

Rails アプリを AWS Lambda で運用する際に必要となる各種設定の雛形やスクリプト群です。

### 利用中サービス
* https://github.com/SonicGarden/rails-electron-update-service
* https://github.com/search?q=org%3ASonicGarden+sg_lambda_rails+path%3AGemfile.lock&type=code

## インストール

```Gemfile``` に以下の内容を追加してください。 

```ruby
gem 'sg_lambda_rails', github: 'SonicGarden/sg_lambda_rails'
```

その後、以下のコマンドを実行してください:

```bash
$ bundle install
```

## 使い方

以下のジェネレータを利用して AWS Lambda 向けの各種ファイルを生成してください。

```bash
$ bin/rails g sg_lambda_rails [アプリ名]
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
