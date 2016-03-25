class HomeController < ApplicationController
  def index
    @card_id = Card.find_random_card
    @card = Card.find(@card_id)
  end

  def checktranslate
    @home_params = get_home_params
    @card = Card.find(@home_params[:id])
    @card.update_attributes(:id => @home_params[:id], :original_text => @home_params[:original_text], :translated_text => @home_params[:translated_text], :review_date => @home_params[:review_date])

    render @card.checkusertranslate(@home_params[:usertext], @home_params[:original_text])
  end

  private

  def get_home_params
    params.require(:home).permit(:id, :usertext, :original_text, :translated_text, :review_date)
  end
end
