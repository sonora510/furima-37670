class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :first_name_zen, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
          validates :family_name_zen, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
          validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "First_name_kana Full-width katakana characters"}
          validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Family_name_kana kana Full-width katakana characters"}
          validates :birthday
          validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9\d]{6,}/ }
         end
          has_many :items
          has_many :product_purchases
 end
 