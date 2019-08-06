FactoryBot.define do
  factory :video do
    sequence(:title) { |n| "#{Faker::Book.title} #{n}" }
    plot { Faker::Book.genre }
    type { 'Movie' }

    trait :purchase_options do
      after(:create) do |video|
        create :purchase_option, video_quality: 'hd', video: video
        create :purchase_option, video_quality: 'sd', video: video
      end
    end
  end
  factory :movie, parent: :video do
    type { 'Movie' }
  end
  factory :season, parent: :video do
    type { 'Season' }
    after(:create) do |video|
      (1..3).reverse_each do |i|
        create :episode, number: i, title: "Episode #{i}", video: video
      end
    end
  end
end