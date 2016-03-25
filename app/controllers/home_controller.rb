class HomeController < ApplicationController
  def index
    @card = Card.find_random_card
  end

  def check_card
    Card.card_find_update(get_home_params[:id])
    flash.now[:success] = "Успех! Перевод верен"
    flash.now[:notice] = "Ошибка! Перевод ошибочный"

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
