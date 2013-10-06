FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'password'
    password_confirmation 'password'
    id 1
  end
end
