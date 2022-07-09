# アプリ名

「スカウター」 <a href="https://scouter.fun/">https://scouter.fun/</a>
<p align="center">
  <img src="https://image.scouter.fun/readme-img.png" width="600" />
</p>

# 概要

主観的になりがちな自分の第一印象をより客観的に把握できるアプリ。

# 目的

* 人と知り合うありとあらゆる場面で最初の情報は相手の視覚的な印象のみ。

* 情報量が多い社会で、人は一つのことにあまり時間をかけない。

* 仮に中身は素晴らしくても印象が悪いだけで多いに機会喪失する可能性。逆も然り。

* 自分が主観的に思ってる自分の印象と相手が客観的に抱いた印象に乖離がある。

* 客観的な印象を知らないとあらゆる改善が徒労になる。

以上のことから、このアプリは、客観的に自分の印象を改善でき、人間関係の最初のステップにおいてより良い結果を得ることを目的としている。自分の印象に悩む、あるいは改善したい幅広い世代が対象。リアルなFace to Faceでなく、マッチングアプリや就活の履歴書の写真にも応用ができる。

# 特徴

* 自分、および他の人の客観的な評価を見ることができる。

* 総合評価の他、世代別、性別別に評価を知ることができる。

# 実装機能

◆ユーザー
* ログイン、ログアウト
* 情報登録、編集、削除
* 画像のアップロードと削除
* ユーザー一覧表示
* ユーザープロフィール表示
* 評価ポイント取得、消失

◆管理者（ユーザー機能以外）
* 検索機能（ID、名前、性別、世代、ポイント、権限）
* ユーザー評価一覧表示

# 環境構築

<p align="center">
  <img src="https://image.scouter.fun/systme.png" width="500" />
</p>

* フロントエンド
    - HTML
    - CSS
    - JavaScript
* バックエンド
    - Ruby 2.7.6
    - Ruby on Rails 6.1.6
    - PostgreSQL 13.7
    - Nginx 1.20-alpine
    - Puma  5.6.4
* インフラ
    - AWS（EC2, Route53, ELB, ACM, RDS, S3, CloudFront）
* その他
    - Git/GitHub
    - VSCode
