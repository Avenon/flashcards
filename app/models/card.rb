class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with CompareStrings
  before_create do
    self.review_date = Time.now + 3.days
  end

  def increase_review_date
    update(review_date: self.review_date + 3.days)
  end

  def self.find_random_card
    # array = Card.check_date.map(&:id) --Вариант передачи параметра в метод .map
    # Card.check_date.pluck(:id)[rand(Card.check_date.pluck(:id).size)]
    where('review_date <= ?', Time.now).order("random()").limit(1)
  end

  def check_translate(usertext)
    usertext.mb_chars.casecmp(original_text.mb_chars) == 0
  end
end
