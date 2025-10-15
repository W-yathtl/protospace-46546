### usersテーブル

| カラム名 | 型 | 制約 |
|-----------|------------|----------------|
| email | string | NOT NULL, ユニーク制約 |
| encrypted_password | string | NOT NULL |
| name | string | NOT NULL |
| profile | text | NOT NULL |
| occupation | text | NOT NULL |
| position | text | NOT NULL |

#### アソシエーション
- has_many :prototypes  
- has_many :comments  

---

### prototypesテーブル

| カラム名 | 型 | 制約 |
|-----------|------------|----------------|
| title | string | NOT NULL |
| catch_copy | text | NOT NULL |
| concept | text | NOT NULL |
| user | references | NOT NULL, 外部キー制約 |

#### アソシエーション
- belongs_to :user  
- has_many :comments  
- has_one_attached :image（ActiveStorage使用）  

---

### commentsテーブル

| カラム名 | 型 | 制約 |
|-----------|------------|----------------|
| content | text | NOT NULL |
| prototype | references | NOT NULL, 外部キー制約 |
| user | references | NOT NULL, 外部キー制約 |

#### アソシエーション
- belongs_to :prototype  
- belongs_to :user  
