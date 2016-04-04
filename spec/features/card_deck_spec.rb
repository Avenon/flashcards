require "rails_helper"

describe 'Check create card' do
  let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }

  it "Card can't create without decks" do
    visit root_path
    click_link "Войти"
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button "Войти"
    click_link "Добавить карточку"
    expect(page).to have_content("Сначала создайте колоду!")
  end
end
