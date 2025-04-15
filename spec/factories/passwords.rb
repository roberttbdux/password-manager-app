# spec/factories/passwords.rb

FactoryBot.define do
    factory :password do
      service { "example.com" }
      email { "testuser@example.com" }
      password { "supersecret" }
      association :user
    end
  end