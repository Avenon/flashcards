class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validates :translated_text, exclusion: { in: :original_text, message: "Must be different with original text" }
end
