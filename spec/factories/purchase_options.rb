FactoryBot.define do
  factory :purchase_option do
    price { 2.99 }
    video_quality { ['hd', 'sd'].sample }
    video { create(:video) }
  end
end