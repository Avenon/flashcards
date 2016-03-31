require "rails_helper"

RSpec.describe Card, type: :model do
  let!(:card) { FactoryGirl.create(:card) }

  it "user text should be equal to original text" do
    card = Card.new(original_text: "house")
    expect(card.check_translate("house")).to eq(true)
  end

  it "user text with capslock should be equal to original text" do
    card = Card.new(original_text: "HoUsE")
    expect(card.check_translate("hOuSe")).to eq(true)
  end

  it "user text with capslock should be equal to original text" do
    card = Card.new(original_text: "test")
    expect(card.check_translate("gotr")).to eq(false)
  end

  it "review date must be increase to 3 day" do
    card.increase_review_date
    expect(card.review_date.strftime('%d/%m/%Y')).to eq((Time.now + 3.days).strftime('%d/%m/%Y'))
  end
end
