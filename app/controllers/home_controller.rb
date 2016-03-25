class HomeController < ApplicationController
  def index
    @card = Card.find_random_card
  end

  def check_card
    get_home_params
    @card = Card.find(get_home_params[:id])
    @reviewdate = @card[:review_date] + (60*60*24*3)
    @card.update_attributes(review_date: @reviewdate)
    @usertext = get_home_params[:usertext]
    @cardtest = @card[:original_text]
    @reviewdate = @card[:review_date]

    if @card.checkusertranslate(get_home_params[:usertext], @card[:original_text])
      render 'success'
    else
      render 'error'
    end
  end

  private

  def get_home_params
    params.require(:home).permit(:id, :usertext)
  end
end
