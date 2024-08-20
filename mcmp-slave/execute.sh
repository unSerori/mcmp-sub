#!/bin/bash

# 停止シグナルのハンドル
stop_handler(){
    echo "Terminating process with PID: ${JAVA_PID}..."
    kill -s TERM $JAVA_PID
    wait $JAVA_PID
    echo "Process with PID: ${JAVA_PID} has been terminated."
}

# シグナルハンドリング
trap stop_handler SIGTERM SIGINT

# 引数を受け取る
MAIN_IP=${1}
echo "\$MAIN_IP: ${MAIN_IP}"

# 何らかの処理

# メインプロセスを実行
java -DmultipaperMasterAddress=${MAIN_IP}:35353 -Xmx512M -Xms128M -jar multipaper.jar &
# JavaプロセスのPIDを取得
JAVA_PID=$!
echo "\$JAVA_PID: ${JAVA_PID}"

# 子プロセスの終了を待つ
wait $JAVA_PID