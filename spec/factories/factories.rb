FactoryGirl.define do
  factory :card do
    original_text "hausE SOmE ДоМ"
    translated_text "hauses"

    trait :to_check do
      review_date 3.days.ago
    end
  end
end
