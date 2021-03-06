require "rails_helper"

describe 'Check register user' do
  it "User must be register correct" do
    visit root_path
    click_link I18n.t :sign_up
    fill_in :user_email, with: "test10@test10.ru"
    fill_in :user_password, with: "test10"
    fill_in :user_password_confirmation, with: "test10"
    page.select :ru, from: :user_locale
    click_button "Create User"
    expect(page).to have_content(I18n.t :description)
  end
end
