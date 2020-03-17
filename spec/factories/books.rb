FactoryBot.define do
  factory :book do
    user_id { 1 }
    title { 'Ruby on Rails教科書' }
    author { '山田　花子' }
  end
end
