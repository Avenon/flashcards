class HomeController < ApplicationController

  def index
    @card_id = Card.find_random_card
    @card = Card.find(@card_id)
  end

  def checktranslate
    @user_check = params.require(:home).permit(:usertext)
    @card_update = params.require(:home).permit(:id, :original_text, :translated_text, :review_date )
    @card = Card.find(@card_update[:id])
    @card.update_attributes(@card_update)

    if @user_check[:usertext].downcase == @card_update[:original_text].downcase
      render "success"
    else
      render "error"
    end
  end
end
