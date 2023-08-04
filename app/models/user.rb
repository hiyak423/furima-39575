class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Input full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Input full-width characters' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Input full-width katakana characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Input full-width katakana characters' }
  end
end
# email, passwordは、deviseにデフォルトで設定済みのため未記入
# メールアドレスは、一意性, @を含む 入力が必須
# パスワードは、半角英数字6文字以上での入力が必須
# パスワードとパスワード（確認）は、値の一致が必須
