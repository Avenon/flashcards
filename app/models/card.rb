class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with CompareStrings

  def self.find_random_card
    # array = Card.check_date.map(&:id) --Вариант передачи параметра в метод .map
    Card.check_date.pluck(:id)[rand(Card.check_date.pluck(:id).size)]
  end

  scope :check_date, -> { where('review_date <= ?', Time.now) }

  def checkusertranslate(usertext, cardtext)
    if usertext.mb_chars.casecmp(cardtext.mb_chars) == 0
      "success"
    else
      "error"
    end
  end
end
