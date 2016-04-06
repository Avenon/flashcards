require "rails_helper"

describe 'Check picture upload' do
  let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }
  let!(:deck) { FactoryGirl.create(:deck, user_id: user.id) }

  it "Picture must be load success" do
    visit root_path
    click_link "Войти"
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button "Войти"
    click_link "Добавить карточку"
    fill_in :card_original_text, with: "test"
    fill_in :card_translated_text, with: "тест"
    attach_file :card_avatar, "#{Rails.root}/spec/support/images/test.jpg"
    click_button "Создать"
    visit root_path
    expect(page).to have_css("img[src*='test.jpg']")
  end
end
