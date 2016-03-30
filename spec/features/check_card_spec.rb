require "rails_helper"

describe 'Check card translate' do

  let!(:card) { FactoryGirl.create(:card) }
  #before(:each) do
  #  @card = FactoryGirl.create(:card)
  #end

  it "correct translation must be show 'Успех'" do
    puts card.id
    @card = Card.find(card.id)
    puts @card
    #unless @card.exists?
    #  puts "test1"
    #end
    visit root_path
    #expect(page).to have_content('Карточки кончились')
    puts page.body
    #page.find('h3').to eq('Карточки кончились')
    #fill_in "text", with: 'test1'
    #click_button('Проверить')
    #expect(card.check_translate("test1")).to eq(true)
    #expect(page.find('h3/text()')).to eq(['Карточки кончились'])
  end
end
