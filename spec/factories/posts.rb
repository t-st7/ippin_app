FactoryBot.define do
  factory :post do
    titile                   {'test'}
    description                      {'投稿についての説明'}
    cooking_time_id                   {'1'}
    association :user

    after(:build) do |post|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end