require "rails_helper"

describe 'Check activate/deactivate decks' do
  let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }
  let!(:deck) { FactoryGirl.create(:deck, user_id: user.id, active: false) }

  it "Field active of the deck should be changed status on true, after click activate" do
    visit root_path
    click_link I18n.t :sign_in
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button I18n.t :sign_in
    visit edit_deck_path(deck)
    click_link I18n.t :change_active_status
    expect(Deck.last.active).to eq(true)
  end

  it "Field active of the deck should be changed status on false, after click deactivate" do
    deck = FactoryGirl.create(:deck, user_id: user.id)
    visit root_path
    click_link I18n.t :sign_in
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button I18n.t :sign_in
    visit edit_deck_path(deck)
    click_link I18n.t :change_active_status
    expect(Deck.last.active).to eq(false)
  end
end
