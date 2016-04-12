class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with CompareStrings
  mount_uploader :avatar, AvatarUploader
  before_create do
    self.review_date = Time.now
    self.level = 0
  end

  def set_level
    level = self.level
    case level
      when 1
        level = 12.hours
      when 2
        level = 3.days
      when 3
        level = 1.weeks
      when 4
        level = 2.weeks
      when 5
        level = 1.month
    end
  end

  def increase_review_date(review)
    if review == true
      update(level: self.level + 1) if self.level < 5
      level = self.set_level
      update(review_date: self.review_date + level)
    else
      update(level: self.level - 1) if self.level > 0
      level = self.set_level
      update(review_date: self.review_date + level)
    end
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
