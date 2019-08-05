FactoryBot.define do
  factory :video do
    title { 'video1' }
    plot { 'test' }
    type { 'Movie' }
  end

  factory :season do
    title { 'season' }
    plot { 'test' }
    type { 'Season' }
  end
end