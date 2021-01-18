FactoryBot.define do
  factory :item do
    item_name        { 'test' }
    text             { 'test' }
    category_id      { 2 }
    state_id         { 2 }
    delivery_id      { 2 }
    area_id          { 2 }
    day_id           { 2 }
    price            { 1000 }
    user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/playboy.png'), filename: 'playboy.png', content_type: 'image/png')
    end
  end
end
