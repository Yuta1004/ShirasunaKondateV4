# ShirasunaKondateV4

## 概要

白砂寮献立アプリ最終ver

## サブプロジェクト

### skondatepy

V3で使用していたPDF解析処理とDB保存処理を1つにまとめ，Dockerイメージ化したもの．  

#### 使用方法

```
// イメージビルド方法
$ docker build --tag "skondatepy:1.0" skondatepy

// 実行(PDFファイルダウンロード→解析→DB更新)
$ docker run -v skondatepy:/srv:rw -it --rm skondatepy:1.0 skondate.py <year> <month>

// 実行(設定ツール)
$ docker run -v skondatepy:/srv:rw -it --rm skondatepy:1.0 settings.py
```

#### 注意

- DockerVolume上に以下のデータを保存します
    - 献立情報DB(.db:sqlite3)
    - 解析元ファイル(.pdf:pdf)
    - NGワードファイル(.txt:txt)

## 実装案

### V1, V3の問題点

- サーバ移転に弱い
- 管理者の変化に弱い
- OSによってデザインや使い心地に差がある
- お問い合わせが機能していない
- 配信データの修正がやりづらい
- 動作環境が固定されていないのでいつ壊れるかわからない

### V4開発について

- gRPC採用
- Flutter採用
- PDF解析処理はV3のものを流用する (少し書き直す)
