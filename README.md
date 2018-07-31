# ポートフォリオ投稿サイト「porpos!」のソース

dockerを使用。
databaseにはpostgresを使用
herokuへのデプロイを考えdocker-compose でrails postgresコンテナを使用し開発→herokuへデプロイ

起動方法:

* Docker for Window, Docker for Mac, docker-toolbox　のいずれかがインストールされている

* git clone を行う

* porposのルートディレクトリ /porpos-web に移動

* docker-compose build を実行し　DBコンテナとRailsコンテナをビルド

* docker-compose up を実行しDBコンテナとRailsコンテナを起動

* localhost:3000　でブラウザからアクセス　（docker-toolboxの場合は　"docker-machine-ip":3000）
