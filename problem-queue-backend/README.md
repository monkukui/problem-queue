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
