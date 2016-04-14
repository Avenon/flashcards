class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  validates :original_text, :translated_text, :review_date, presence: true
  validates_with CompareStrings
  mount_uploader :avatar, AvatarUploader
  before_create do
    self.review_date = Time.now
  end

  def set_review_period
    case self.level
      when 0
        0
      when 1
        12.hours
      when 2
        3.days
      when 3
        1.weeks
      when 4
        2.weeks
      when 5
        1.month
    end
  end

  def increase_review_date(review)
    if review
      self.level += 1 if self.level < 5
      update(review_date: self.review_date + self.set_review_period, attempt: 1, level: self.level)
    elsif self.attempt < 3
      update(attempt: self.attempt + 1)
    else
      self.level -= 1 if self.level > 1
      update(review_date: self.review_date - self.set_review_period, attempt: 1, level: self.level)
    end
  end

  def self.find_random_card
    # array = Card.check_date.map(&:id) --Вариант передачи параметра в метод .map
    # Card.check_date.pluck(:id)[rand(Card.check_date.pluck(:id).size)]
    where('review_date <= ?', Time.now).order("random()").limit(1)
  end

  def check_translate(usertext)
    Levenshtein.distance(usertext.downcase, original_text.downcase)
  end

  def self.send_mails
    Card.select(:user_id).distinct.where('review_date<?', Time.now).map do |i|
      CardMailer.send_expired_cards(User.find(i.user_id).email).deliver_now
    end
  end
end
