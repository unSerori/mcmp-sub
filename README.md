# mcmp-sub

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
    MY_PORT=main側が決めるこのサーバーの名前 main管理者に貰うべき
    VELOCITY_KEY=main側で決まる鍵 main管理者にもらうべき
    MAIN_IP=mainのIP main管理者にもらうべき （IPは途中で変更される可能性があることに留意）
    ```

## mainへの接続

ポート開放かtailscaleでシェアするのが楽だと感じた  
ただ、ポート開放だと施設のネットワーク構成よってはダメになるかもしれないからtailscaleでVPN建てて、デバイスをシェアして接続してもらうのがいいと思う

### tailscale導入のメリット

- ポート開放しなくていい
- ローカルのデバイス名でアクセスできるから、グローバルIPの変更があってもサーバー設定を更新しなくていい

### subでのtailscale導入手順

1. tailscaleの垢登録: [登録サイト](https://login.tailscale.com/start)
2. 登録の後そのまま進めば各OSごとのインストール手順があるので従う
3. [管理コンソール](https://login.tailscale.com/admin/machines)でマシンのシェアリンクを取得してプレイヤーに共有

## sub起動 (windows以外のOSの起動ファイルはstart.batを参考にどうぞ)

初回起動

```cmd
update.bat
```

2回目以降

```cmd
start.bat
```

## サーバーストップ (windows以外のOSの停止ファイルはstop.batを参考にどうぞ)

```cmd
stop.bat
```

## サーバーアップデート (windows以外のOSの更新ファイルはupdate.batを参考にどうぞ)TODO: 

### 新しいバージョンがリリースされた場合の更新方法

諸情報を更新してスクリプト実行

- .env内のMULTIPAPER_SLAVE_URLを更新
- .env内のBASE_IMAGEを適切なJKDイメージに変更

```bash
# 再ビルド&再起動
bash update.sh
```
