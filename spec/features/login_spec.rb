require "rails_helper"

describe 'Check user login' do
  let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }

  it "User must be loggin correct" do
    visit root_path
    click_link "Войти"
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button "Войти"
    expect(page).to have_content('Вы успешно вошли')
  end

  it "User must be loggin incorrect" do
    visit root_path
    click_link "Войти"
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test111"
    click_button "Войти"
    expect(page).to have_content('Неверный логин')
  end
end
