FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    family_name           {'倉友'}
    first_name            {'博邦'}
    family_name_kana      {'クラ'}
    first_name_kana       {'トモ'}
    birth_day             {"2021-02-14"}
  end
end