class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with CompareStrings

  def self.find_random_card
    array = Card.check_date.map(&:id)
    array[rand(array.size)]
  end

  scope :check_date, -> { where('review_date <= ?', Time.now) }
end
