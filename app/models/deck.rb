class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  belongs_to :user

  def self.find_active_deck
    find_by(active: true)
  end
end
