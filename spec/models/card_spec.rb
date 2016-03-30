require "rails_helper"

RSpec.describe Card, type: :model do
  before(:each) do
    @card = FactoryGirl.create(:card)
  end

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
    expect(@card.increase_review_date).to eq(true)
  end

  it "validate original text and translaste text should be different" do
    expect(@card.errors[:base]).to_not eq(["Must be different"])
  end
end
