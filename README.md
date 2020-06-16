# Problem Queue

## 必要な情報（データベース的な？）
User {
  id: int,
  name: string
}
Problem {
  id: int,
  uid: int（user id）
  priority: int（優先度）
  memo: string（めも）
  time: string?（タイムスタンプ）
  color: string（"012,112,255" みたいな（アイテムの色を選択できると楽しいかも））
}

## 必要な API
/problems?user=monkukui
で，Problem  の配列を返す1
