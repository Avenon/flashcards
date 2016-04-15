require "rails_helper"

describe 'Check create card' do
  let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }

  it "Card can't create without decks" do
    visit root_path
    click_link I18n.t :sign_in
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button I18n.t :sign_in
    click_link I18n.t :add_card
    expect(page).to have_content(I18n.t :alert_card)
  end
end
