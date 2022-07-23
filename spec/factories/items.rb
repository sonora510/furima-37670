FactoryBot.define do
  factory :item do

    # 商品名
    product { Faker::Commerce.product_name }
    # 商品説明
    information { Faker::Commerce.department}
    # カテゴリー
    category_id { 2 }
    # 商品の状態
    status_id { 2 }
    # 配送料の負担
    delivery_cost_id { 2 }
    # 配送元の地域
    prefecture_id { 2 }
    # 発送日数
    delivery_day_id { 2 }
    # 価格
    price { 300 }

    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
    association :user
  end
end
