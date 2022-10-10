FactoryBot.define do
  factory :user, class: 'User' do
    id {Faker::Number.digit}
    email {Faker::Internet.email}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    status {1}
    created_at {Date.today}
  end
end