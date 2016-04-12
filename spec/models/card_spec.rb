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

  it "review date must be increase to 12 hours" do
    card.increase_review_date(true)
    expect(card.review_date.strftime('%H:%M')).to eq((Time.now.utc + 12.hours).strftime('%H:%M'))
  end

  it "review date must be increase to 3 days" do
    card = Card.new(original_text: "house", level: 1, attempt: 1, review_date: Time.now)
    card.increase_review_date(true)
    expect(card.review_date.strftime('%d/%m/%Y')).to eq((Time.now.utc + 3.days).strftime('%d/%m/%Y'))
  end

  it "review date must be increase to 1 week" do
    card = Card.new(original_text: "house", level: 2, attempt: 1, review_date: Time.now)
    card.increase_review_date(true)
    expect(card.review_date.strftime('%d/%m/%Y')).to eq((Time.now.utc + 1.weeks).strftime('%d/%m/%Y'))
  end

  it "review date must be increase to 2 weeks" do
    card = Card.new(original_text: "house", level: 3, attempt: 1, review_date: Time.now)
    card.increase_review_date(true)
    expect(card.review_date.strftime('%d/%m/%Y')).to eq((Time.now.utc + 2.weeks).strftime('%d/%m/%Y'))
  end

  it "review date must be increase to 1 month" do
    card = Card.new(original_text: "house", level: 4, attempt: 1, review_date: Time.now)
    card.increase_review_date(true)
    expect(card.review_date.strftime('%d/%m/%Y')).to eq((Time.now.utc + 1.month).strftime('%d/%m/%Y'))
  end

  it "level must be increase up to 1 when result translate is true" do
    card = Card.new(original_text: "house", level: 0, attempt: 1, review_date: Time.now)
    card.increase_review_date(true)
    expect(card.level).to eq(1)
  end

  it "attempt must be increase up to 2 when result translate is false" do
    card = Card.new(original_text: "house", level: 0, attempt: 1, review_date: Time.now)
    card.increase_review_date(false)
    puts card.attempt
    expect(card.attempt).to eq(2)
  end
end
