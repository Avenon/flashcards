require "rails_helper"

describe 'Check card translate' do
  let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }
  let!(:card) { FactoryGirl.create(:card, user_id: user.id) }

  before(:each) do
    visit root_path
    click_link "Войти"
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button "Войти"
  end

  it "correct translation must be show 'Успех'" do
    visit root_path
    #puts page.body Для отладки в capybara
    fill_in "home_usertext", with: 'test1'
    click_button('Проверить')
    expect(page).to have_content('Успех! Перевод верен')
  end

  it "incorrect translation must be show 'Ошибка'" do
    visit root_path
    fill_in "home_usertext", with: 'test2'
    click_button('Проверить')
    expect(page).to have_content('Ошибка! Перевод ошибочный')
  end
end
