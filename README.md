# README

| <img width=200/>記述内容 | 備考 |
| -------- | ------- |
| アプリケーション名 | ippin  
| アプリケーション概要 | 自分のお気に入りの酒の肴やお酒を投稿することができ、投稿した名前や具材で検索することが出来る。
| URL   | https://cooking-ippin-app.herokuapp.com/
|テスト用アカウント | Email: 111@111  password: 111111
| 利用方法 | お酒にまつわる物でしたら何を投稿しても大丈夫。いつも作っている自分のおつまみ("一品")や、新商品、好きなお酒を、お酒好きな人達と共有してみませんか？既製品でも違う作り方で、「こんな作り方があるのか」という感動、同じ材料でも違う作り方をしてる”一品”に出会うかもしれません。自分だけの「自由で至福な時間」を、増やせるきっかけになれたら幸いです。
| 目指した課題解決 |少しいつもと違う味にしたいなと思った時、新しい料理を作りたい時、に参考になるようにしたい。
| 洗い出した要件 | - 投稿機能がついている。- 複数条件検索が出来る。 - 画像がいつでも見ることが出来る。
| 環境 | Ruby '2.6.5'    rails '6.0.0'


### 実装した機能について
- 投稿時に、調理に必要な具材をユーザーが好きなだけ増やせるようにした。
- ある具材や、作りたい料理を参考に作れるように、一つのフォームでモデル間の投稿検索機能を出来るようにしました。
- 
### 実装予定の機能	
- 画像がいつでも見る事が出来るようにします。
- レシピを書きたい場合に、保存できるようにしユーザーもクリックすれば見れるようにする。
- レシピも含めた、編集機能の実装。
- お気に入り登録機能。
- ジャンル別で投稿、検索できるようにしたい。(お酒、料理、新商品[お酒、既製品の食べ物[コンビニの商品ならコンビニ毎]])
### ER図

![ippin_er1](https://user-images.githubusercontent.com/76399553/108328504-0989c880-7210-11eb-9b53-423b5d88e30a.png)





# テーブル設計

## users テーブル
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | null: false  |

### Association
- has_many :posts
- has_many :comments


## posts テーブル
| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| title              | string  | null: false  |
| description        | text    | null: false  |
| cooking_time_id    | integer | null: false  |
| user               | references | null: false, foreign_key: true  |

### Association
- has_many :users
- has_many :ingredients
- has_many :comments

## ingredients テーブル
| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| topping            | string  | null: false  |
| gram               | string  | null: false  |
| post               | references | null: false, foreign_key: true  |

### Association
- belongs_to :post


## comments テーブル
| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| text               | text    | null: false  |
| user               | references | null: false, foreign_key: true  |
| post              | references | null: false, foreign_key: true  |

### Association
- belongs_to :post
- belongs_to :user
