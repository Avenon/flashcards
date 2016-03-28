class HomeController < ApplicationController
  def index
    @card = Card.find_random_card
  end

  def check_card
    @card = Card.find(get_home_params[:id])
    result = @card.check_translate(get_home_params[:usertext])
    @card.increase_review_date
    flash[:notice] =
      if result
        "Успех! Перевод верен"
      else
        "Ошибка! Перевод ошибочный"
      end

    redirect_to root_path
  end

  private

  def get_home_params
    params.require(:home).permit(:id, :usertext)
  end
end
