# Problem Queue

## 必要な情報（データベース的な？）
```
User {
  id: int,
  name: string
}
```

```
Problem {
  id: int,
  uid: int（user id）
  priority: int（優先度）
  memo: string（めも）
  time: string?（タイムスタンプ）
  color: string（"012,112,255" みたいな（アイテムの色を選択できると楽しいかも））
}
```

## 必要な API
`/problems?user=monkukui`
で，Problem  の配列を返す1

## 使えそうな外部 API
`https://kenkoooo.com/atcoder/resources/problem-models.json`
Difficulty を取得できる

## rails を JSON API として運用する際に，参考になりそうなサイト
https://qiita.com/k-penguin-sato/items/adba7a1a1ecc3582a9c9
http://hacktomo.hatenablog.com/entry/2017/12/14/012423
