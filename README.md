

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