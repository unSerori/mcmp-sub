# mcmp-main

## 概要

MultiPaperを使って負荷分散マイクラサーバを立てる。  
MultiPaperはworldデータの保持とロードバランサーを行うMasterと実際のサーバ処理を行うslaveがある。これは負荷分散を担うサーバリポジトリ。  

自分がプレイヤーとして参加する際などwin10PCを起動している間に起動して負荷分散に参加する。[メインの管理側](https://github.com/unSerori/mcmp-main)  

## 環境構築

1. Dockerをインストールし、コンテナーを展開できるようにする
2. mcmp-project-masterをクローン

    ```bash
    # clone
    git clone https://github.com/unSerori/mcmp-sub.git
    ```

3. .envファイルをコピーまたは作成

    ```env:.env TODO: 
    BASE_IMAGE=jkdのベースイメージ。ここではeclipse-temurin:x.y.z_a-jdkを使用。
    MULTIPAPER_SLAVE_URL=multipaper-x.y.z-a.jarのDLリンク
        
    MY_NAME=main側が決めるこのサーバーの名前 main管理者に貰うべき
    MAIN_IP=mainのIP main管理者にもらうべき （IPは途中で変更される可能性があることに留意）

    MY_IP=このサーバーのIP （IPは途中で変更される可能性があることに留意）
    ```

## サーバーアップデート TODO: 

新しいバージョンがリリースされた場合の更新方法

- .env内のMULTIPAPER_SLAVE_URLを更新
- .env内のBASE_IMAGEを適切なJKDイメージに変更

```bash
# 再ビルド&再起動
docker compose build && docker compose up -d

# (詳細なログはbuildコマンドに以下を追加)
--progress=plain
```

## マイクラ鯖起動

```bash
# SSHで入った後以下実行でコンテナーup
docker compose up -d

# サーバーシャットダウン
```
