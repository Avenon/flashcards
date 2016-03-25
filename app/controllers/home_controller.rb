class HomeController < ApplicationController
  def index
    @card = Card.find_random_card

    if @card.exists?
      @card = @card.find(@card)
    else
      @card = nil
    end
  end

  def checktranslate
    @home_params = get_home_params
    @card = Card.find(@home_params[:id])
    @card.update_attributes(review_date: @home_params[:review_date])

    if @card.checkusertranslate(@home_params[:usertext], @home_params[:original_text])
      render 'success'
    else
      render 'error'
    end
  end

  private

  def get_home_params
    params.require(:home).permit(:id, :usertext, :original_text, :translated_text, :review_date)
  end
end
