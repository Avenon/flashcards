require 'rails_helper'

RSpec.describe Deck, type: :model do
  let!(:deck) { FactoryGirl.create(:deck) }

  it "find_active_card must be return true" do
    expect(Deck.find_active_deck.active).to eq(true)
  end
end
