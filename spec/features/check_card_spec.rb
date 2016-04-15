require "rails_helper"

describe 'Check card translate' do
  let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }
  let!(:card) { FactoryGirl.create(:card, user_id: user.id) }

  before(:each) do
    visit root_path
    click_link I18n.t :sign_in
    fill_in :email, with: "test@test.ru"
    fill_in :password, with: "test"
    click_button I18n.t :sign_in
  end

  it "correct translation must be show succes" do
    visit root_path
    #puts page.body Для отладки в capybara
    fill_in "home_usertext", with: 'test1'
    click_button I18n.t :check_translate
    expect(page).to have_content(I18n.t :translate_succes)
  end

  it "incorrect translation must be show error" do
    visit root_path
    fill_in "home_usertext", with: 'teedest2'
    click_button I18n.t :check_translate
    expect(page).to have_content(I18n.t :translate_error)
  end

  it "incorrect translation with one mistake must be show mistake" do
    visit root_path
    fill_in "home_usertext", with: 'test2'
    click_button I18n.t :check_translate
    expect(page).to have_content(I18n.t :translate_mistake)
  end
end
