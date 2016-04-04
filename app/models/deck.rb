class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  belongs_to :user

  def self.deactive_decks
    @decks.each do |i|
    i.update_attributes(active: true)
  end
  end
end
