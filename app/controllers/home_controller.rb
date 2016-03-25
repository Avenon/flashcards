class HomeController < ApplicationController
  def index
    @card = Card.find_random_card
  end

  def check_card
    Card.increase_review_date

  flash[:notice] =
    if Card.check_translate(get_home_params[:usertext])
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
