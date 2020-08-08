# README

## requirement
- postgres (PostgreSQL) 12.1
- Rails 5.2.4.3

## develop

```
cd problem-queue-backend
```

install gem
```
bundle install
```

postgresql
```
❯ pg_ctl -D /usr/local/var/postgres start
waiting for server to start....2020-08-08 16:50:16.469 JST [5058] LOG:  starting PostgreSQL 12.1 on x86_64-apple-darwin16.7.0, compiled by Apple LLVM version 8.1.0 (clang-802.0.42), 64-bit
2020-08-08 16:50:16.475 JST [5058] LOG:  listening on IPv6 address "::1", port 5432
2020-08-08 16:50:16.475 JST [5058] LOG:  listening on IPv4 address "127.0.0.1", port 5432
2020-08-08 16:50:16.475 JST [5058] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
2020-08-08 16:50:16.583 JST [5059] LOG:  database system was shut down at 2020-08-08 00:59:40 JST
2020-08-08 16:50:16.603 JST [5058] LOG:  database system is ready to accept connections
 done
server started
```

rails サーバー起動
```
rails server
```

api を叩いてみる
```
http://localhost:3000/v1/problems
```

```
[
  {"id":1,"memo":"後で解く","priority":1,"problem_str":"abc172_a","user":{"id":1,"name":"monkukui"}},
  {"id":2,"memo":"b 問題は難しい \u003e\u003c","priority":1,"problem_str":"abc172_b","user":{"id":1,"name":"monkukui"}},
  {"id":3,"memo":"復習したい問題","priority":1,"problem_str":"abc132_a","user":{"id":2,"name":"tab"}},
  {"id":4,"memo":"e 問題もお手の物","priority":1,"problem_str":"abc132_e","user":{"id":2,"name":"tab"}},
  {"id":5,"memo":"水嶋ヒロ","priority":3,"problem_str":"abc100_f","user":{"id":3,"name":"rsk0315"}},
  {"id":6,"memo":"f にゃー","priority":3,"problem_str":"abc101_f","user":{"id":3,"name":"rsk0315"}},
  {"id":7,"memo":"やってられん","priority":5,"problem_str":"abc181_f","user":{"id":3,"name":"rsk0315"}},
  {"id":8,"memo":"やってられん（こちらが正しい）","priority":5,"problem_str":"abc181_f","user":{"id":1,"name":"monkukui"}}
]
```


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
