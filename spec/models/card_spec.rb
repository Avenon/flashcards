require "rails_helper"

RSpec.describe Card, type: :model do
  it "user text should be equal to original text" do
    card = Card.new(original_text: "house")
    expect(card.check_translate("house")) == true
  end

  it "user text with capslock should be equal to original text" do
    card = Card.new(original_text: "HoUsE")
    expect(card.check_translate("hOuSe")) == true
  end

  it "review date must be increase to 3 day" do
    card = Card.new(review_date: Time.now)
    expect(card.increase_review_date) == Time.now + 3.days
  end
end
