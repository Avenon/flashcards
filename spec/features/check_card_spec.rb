require "rails_helper"
describe 'Check card translate' do

  let!(:card) { FactoryGirl.create(:card) }

  it "correct translation must be show 'Успех'" do
    visit root_path
    # puts page.body Для отладки в capybara
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
