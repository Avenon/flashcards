class HomeController < ApplicationController
  def index
    @card = Card.find_random_card
  end

  def check_card
    card_find_update

    if @card.check_translate(get_home_params[:usertext], @card[:original_text])
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
