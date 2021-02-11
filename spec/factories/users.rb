FactoryBot.define do
  factory :user do
    nickname { '田中' }
    email { Faker::Internet.email }
    password { 'test12' }
    password_confirmation { password }
    first_name { '田中' }
    last_name { '武' }
    first_name_kana { 'タナカ' }
    last_name_kana { 'タケシ' }
    date { '1930-03-02' }
  end
end
