class HomeController < ApplicationController
  def index
    @card = Card.find_random_card
  end

  def check_card
    Card.increase_review_date(get_home_params[:id])

  flash.now[:notice] =
    if Card.check_translate(get_home_params[:usertext])
      "Успех! Перевод верен"
    else
      "Ошибка! Перевод ошибочный"
    end

    if Card.check_translate(get_home_params[:usertext])
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
