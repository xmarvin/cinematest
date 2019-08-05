FactoryBot.define do
  factory :purchase do
    price { 2.99 }
    video_quality { 'hd' }
    expires_at { 2.days.from_now }
  end
end