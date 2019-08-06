FactoryBot.define do
  factory :purchase do
    expires_at { 2.days.from_now }
    purchase_option { create(:purchase_option) }
    user { create(:user) }
  end
end