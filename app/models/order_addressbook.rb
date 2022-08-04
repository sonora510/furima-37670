class OrderAddressbook
  include ActiveModel::Model

  # orderテーブル、addressbookテーブルへ保存するカラム
  attr_accessor :token, :user_id, :item_id, :order_id, :post_code, :prefecture_id, :city, :banti, :bilding_name, :phone_num

  # バリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
  
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postnum can't be blank" }
    validates :city
    validates :banti
    validates :phone_num, format: { with: /\A0(\d{1}?\d{4}|\d{2}?\d{3}|\d{3}?\d{2}|\d{4}?\d{1})?\d{4}\z|\A0[5789]0?\d{4}?\d{4}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "Can't be blank"}

  # データをテーブルへ保存
  def save
    # 購入情報を保存し、変数Orderへ代入 (カラム名: 保存したい値)
    order = Order.create(item_id: item_id, user_id: user_id)
    # binding.pry
    # 住所を保存
    # order_idは変数orderのidと指定する
    Addressbook.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, banti: banti,bilding_name: bilding_name, phone_num: phone_num)

    end
end