class Item < ApplicationRecord
  
  # 1:1 item:imageテーブル
  has_one_attached :image
end
