require "rails_helper"

describe 'Check card translate' do

  let!(:card) { FactoryGirl.create(:card) }

  it "correct translation must be show 'Успех'" do
    visit 'http://localhost:3000/'
    fill_in "home_usertext", :with => 'test1'
    click_button('Проверить')
    expect(card.check_translate("test1")).to eq(true)
  end
end
