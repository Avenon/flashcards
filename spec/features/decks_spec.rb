require "rails_helper"

describe 'Check activate/deactivate decks' do
  let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }
  let!(:deck) { FactoryGirl.create(:deck, user_id: user.id, active: false) }

  it "Deck should be activate" do
    visit root_path
    click_link "Войти"
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button "Войти"
    click_link "Все колоды"
    click_link "изменить"
    click_link "Активировать"
    expect(page).to have_content("true")
  end

  it "Deck should be deactivate" do
    visit root_path
    click_link "Войти"
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button "Войти"
    click_link "Все колоды"
    click_link "изменить"
    deck.active = true
    click_link "Неактивная"
    puts page.body
    expect(page).to have_content("false")
  end
end

