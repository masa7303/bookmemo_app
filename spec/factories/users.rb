FactoryBot.define do
  factory :user do
    uid { '12345' }
    provider { "twitter" }
    name { "テストユーザー" }
  end
end
