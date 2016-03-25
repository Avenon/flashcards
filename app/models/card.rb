class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with CompareStrings
  def self.card_find_update(id)
    @card = Card.find(id)
    @card.update_attributes(review_date: @card[:review_date] + 3.days)
  end

  def self.find_random_card
    # array = Card.check_date.map(&:id) --Вариант передачи параметра в метод .map
    # Card.check_date.pluck(:id)[rand(Card.check_date.pluck(:id).size)]
    @card = Card.check_date
    @card =
      if @card.exists?
        @card.find(@card)
      else
        nil
      end
  end

  scope :check_date, -> { where('review_date <= ?', Time.now).order("random()").limit(1) }

  def self.check_translate(usertext)
    usertext.mb_chars.casecmp(@card[:original_text].mb_chars) == 0
  end
end
