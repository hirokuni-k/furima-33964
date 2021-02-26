FactoryBot.define do
  factory :purchase_shipping do
    post_code           {"123-4567"}
    prefecture_id       {1}
    city                {"てっく"}
    address             {"てっく"}
    building_name       {"もう"}
    phone_number        {123}
    token               {"abc_d000000000"}
  end
end
