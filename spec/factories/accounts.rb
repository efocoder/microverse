FactoryBot.define do
  factory :account, class: 'Account' do
    email {'test@gmail.com'}
    role_id {1}
    password {'pas123456'}
  end
end
