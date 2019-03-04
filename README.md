# ポートフォリオ投稿サイト「porpos!」　　
　　
## 概要
**使用技術**  
* docker
* ruby
* ruby on rails
* bootstrap
* postgres  
* heroku
  
docker-compose でrails postgresコンテナを使用し開発→herokuへデプロイ  

## 起動方法

* Docker for Window
* Docker for Mac
* docker-toolbox  
  
のいずれかがインストールされていること。  
  
**docker image build**  
`docker-compose build`  
  
**create**  
`docker-compose run web bundle exec rails db:create`  
  
**migrate**  
`docker-compose run web bundle exec rails db:migrate`  
  
**起動**  
`docker-compose up`  
background実行する場合は`-d`オプションを付与。  
    
**アクセス**  
```
localhost:3000
```
でブラウザからアクセス　（docker-toolboxの場合は　"docker-machine-ip":3000）
