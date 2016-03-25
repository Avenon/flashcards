class HomeController < ApplicationController
  def index
    @card = Card.find_random_card
  end

  def check_card
    get_home_params
    @card = Card.find(get_home_params[:id])
    @card.update_attributes(review_date: @card[:review_date] + (60 * 60 * 24 * 3))
    flash.now[:usertext] = get_home_params[:usertext]
    flash.now[:original_text] = @card[:original_text]
    flash.now[:review_date] = @card[:review_date] + (60 * 60 * 24 * 3)

    if @card.checkusertranslate(get_home_params[:usertext], @card[:original_text])
      flash.now[:notice] = "Успех! Перевод верен"
      render 'success'
    else
      flash.now[:notice] = "Ошибка! Перевод ошибочный"
      render 'error'
    end
  end

  private

  def get_home_params
    params.require(:home).permit(:id, :usertext)
  end
end
