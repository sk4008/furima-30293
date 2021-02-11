FactoryBot.define do
  factory :order_form do
    postal_code       { '000-0000' }
    prefectures_id    { 2 }
    municipality      { 'テスト' }
    address           { 'テスト' }
    building_name     { 'テスト' }
    telephone_number  { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
