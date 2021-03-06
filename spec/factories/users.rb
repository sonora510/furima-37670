FactoryBot.define do
  factory :user do
    nickname { Faker::JapaneseMedia::DragonBall.character }
    email { Faker::Internet.free_email }
    # password {Faker::Lorem.characters(min_alpha: 1, min_numric: 1, min_length: 6)}
    password { Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    # password {Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
    # password {'test123'}
    password_confirmation { password }
    family_name_zen { '山田' }
    first_name_zen { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '1930-01-01' }
  end
end
