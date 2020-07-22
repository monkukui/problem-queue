# Problem Queue

## 概要
- とりあえず最低限必要な機能を作る
- AtCoder のみ対応
- AtCoder Problems に存在する問題を push できる（フロント側で検索できるようにする）
- Queue は一つ
- ログインできるようにする
- シンプル機能にする

## 必要な情報（データベース）

ユーザ情報
```
User {
  id: int
  name: string
  pass: string（ハッシュ化する）
}
```

```
ProblemQueue {
  id: int
  user_id: int
  contest_id: string
  problem_id: string
  priority: int（優先度）
  memo: string（めも）
  time: string?（タイムスタンプ）
  color: string（"012,112,255" みたいな（アイテムの色を選択できると楽しいかも））
}
```
問題の url は
`https://atcoder.jp/contests/<contest_id>/tasks/<problem_id>`みたいになっている
例
`https://atcoder.jp/contests/abc173/tasks/abc173_b`

## 必要なページ

- `/`
画面中央に Queue が設置されていて，問題 Queue を見れる
`/problems` を叩く
トップページからモーダルで問題 push できるようにする

## 必要な API

- `/problems` ログインしている人の問題一覧を取得

- `/pop/<id>` 
    - `ProblemQueue` の `id` を指定して，`DELETE` する
    - フロントエンドでは，表示されている問題から選択できるようにする
    - バックエンドでは，本当に問題があるかチェックして，あったら決して `true` を返す．なかったら `false` を返す

- `/push/<contest_id>/<problem_id>`
    - 問題を追加する
    - フロントエンドでは，AtCoder Problems の `https://kenkoooo.com/atcoder/resources/problems.json` を叩いて一覧取得し，AtCoder Problems のバチャ画面のような検索機能を実装
    - バックエンドでも同様の api を叩いて，本当に問題が存在するかチェック

## 使う外部 API
`https://kenkoooo.com/atcoder/resources/problem-models.json`
Difficulty を取得できる

## rails を JSON API として運用する際に，参考になりそうなサイト
https://qiita.com/k-penguin-sato/items/adba7a1a1ecc3582a9c9
http://hacktomo.hatenablog.com/entry/2017/12/14/012423

認証付きで一番良さそう
https://qiita.com/ochiochi/items/966b884eb17045dfb929

こっちはハッシュ化されて保存されそう
https://dev.m6a.jp/entry/2018/11/14/162259
