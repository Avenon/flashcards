require "rails_helper"

RSpec.describe Card, type: :model do
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
    card = Card.create(original_text: "test1", translated_text: "текст1", review_date: Time.now)
    expect(card.increase_review_date).to eq(true)
  end

  it "validate original text and translaste text should be different" do
    card = Card.create(original_text: "test", translated_text: "Test", review_date: Time.now)
    expect(card.errors[:base]).to eq(["Must be different"])
  end
end
