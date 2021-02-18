FactoryBot.define do
  factory :item do
    name               {"テスト"}
    price              {23456}
    description        {'ここはなんでもいいはず'}
    condition_id       {1}
    shipping_charge_id {2}
    prefecture_id      {1}
    shipping_date_id   {2}
    category_id        {999}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  
  end
end
