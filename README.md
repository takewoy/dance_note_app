# dance_note_app

[Hive](https://pub.dev/packages/hive)の後継にあたる[Isar](https://pub.dev/packages/isar)を使用してみたかったので作成(まだ開発中)。

せっかくなので、趣味でやっている社交ダンス10種目のノートが取れるようなアプリ。
今のところiOS、Android、デスクトップ対応。(動作確認はiOSとMacOS)

特にGitHubにあげるつもりはなかったけど、Publicレポジトリに何も置いてないと、
友人から「頑張ってない人」扱いされるので置くことにした。:)

## SETUP

Flutterのバージョン管理にはfvmを利用しています。
`dart pub global activate fvm`を実行後、
`fvm use 3.0.5 -f`を実行してください。

またmelosを利用しているので、melosも有効化してください。
`dart pub global activate melos`

## TODO

- Web対応(path_providerが未対応だからちょっと難しいのかな？要調査)。
- 急いで作ったのでリファクタリングしたい。
