FactoryBot.define do
  factory :order_addressbook do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜' }
    banti { '青山1−1−1' }
    bilding_name { '柳ビル103' }
    phone_num { '09012345678' }
  end
end