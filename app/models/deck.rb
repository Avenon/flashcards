class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  belongs_to :user

  def self.find_active_deck
    # array = Card.check_date.map(&:id) --Вариант передачи параметра в метод .map
    # Card.check_date.pluck(:id)[rand(Card.check_date.pluck(:id).size)]
    select(:id).where('active = ?', true).map { |i| i.id }
  end
end
