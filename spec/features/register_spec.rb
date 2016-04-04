require "rails_helper"

describe 'Check register user' do
  it "User must be register correct" do
    visit root_path
    click_link "Регистрация"
    fill_in :user_email, with: "test10@test10.ru"
    fill_in :user_password, with: "test10"
    fill_in :user_password_confirmation, with: "test10"
    click_button "Create User"
    expect(page).to have_content('Первый в мире удобный менеджер флеш-карточек. Именно так')
  end
end
