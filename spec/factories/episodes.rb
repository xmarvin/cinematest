FactoryBot.define do
  factory :episode do
    video { create(:video) }
    number { 1 }
    sequence(:title) { |n| "#{Episode} #{n}" }
  end
end