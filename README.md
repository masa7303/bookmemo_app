# BOOKMEMO
http://bookmemo-app.com/
(https://user-images.githubusercontent.com/50639339/75736010-71b17700-5d3f-11ea-9705-1b2a44311bab.png)

- メニュー内のテストログインボタンから、【テストユーザー】としてログインできます。
- テストユーザー情報の編集は出来ない仕様になっています。ご了承ください。

# サービス概要

読書が好きで本をよく読む人が、読んだ本や本の内容を忘れないようにするためのサービスです。<br>
自分の好きな本を発信することで、共通の趣味を持つ人たちともつながれます。

# ユーザーが抱える課題

昔から本が好きでよく読んでいたが、最近は読む時間も少なくなってきた上、読んだ内容も忘れがち。<br>
仕事や学校で忙しいため読み返すのも難しい。<br>
自分の好きな本をまとめて管理し、気に入った文章は保存。あとで定期的にリマインドしてくれるサービスが欲しい。

# 解決方法

読んだ本を写真付きで登録できることにより、視覚的わかりやすく管理。<br>
定期的に文章もリマインドしてくれることで、読んだ本の内容を記憶しやすいようにする。

# マーケット

読書が好きで、読んだ本の内容を忘れずに記憶したい人

# 使用技術

## 環境
- Ruby 2.5.1
- Rails 5.2.3
- MySQL
- Docker

## インフラ
- NginX
- unicorn
- AWS (EC2, VPC, Route53, Elastic IP)
- CircleCI

# フロントエンド
- Bootstrap
- jQuery

# バックエンド
- 画像アップロード・削除（Active Storage）
- 本と文章の、投稿・削除・編集機能
- ユーザー登録・ログイン機能（Twitter Oauth）
- お気に入り機能（Ajax）
- ページネーション機能（Kaminari）
- 検索機能
