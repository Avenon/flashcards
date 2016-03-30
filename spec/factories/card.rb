FactoryGirl.define do
  factory :card do
    original_text "test1"
    translated_text "текст1"
    review_date Time.now
  end
end
