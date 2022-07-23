class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # ジャンルの選択時「--」の時は保存できない
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_day_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :status_id
  end

  # ActiveHash アソシエーション
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :status
  belongs_to :user

  # 1:1 item:imageテーブル
  has_one_attached :image
end
