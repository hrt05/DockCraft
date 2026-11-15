# javaの実行環境が入ったベースイメージらしい
FROM eclipse-temurin:25-jre

# ダウンロードURLをビルド時に渡す変数
ARG SERVER_JAR_URL

# 作業フォルダ
WORKDIR /server

# ←追加元　追加先→
ADD ${SERVER_JAR_URL} /opt/minecraft/server.jar

# 25565を使うという宣言
EXPOSE 25565

CMD ["sh", "-c", "echo 'eula=true' > eula.txt && exec java -Xms1G -Xms4G -jar /opt/minecraft/server.jar nogui"]                    