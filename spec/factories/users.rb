Factory_bot.define do
  factory :user do
    name { 'テストユーザー' }
    uid { 'ENV['TESTLOGIN_ID']' }
    provider { 'twitter' }
  end
end
