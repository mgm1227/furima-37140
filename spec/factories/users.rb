FactoryBot.define do
  factory :user do
    name_first            { '井' }
    name_family           { '井' }
    name_first_kana       { 'カタカナ' }
    name_family_kana      { 'カタカナ' }
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a111111' }
    password_confirmation { password }
    birthday              { '1111-11-11' }
  end
end
