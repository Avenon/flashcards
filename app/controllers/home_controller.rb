class HomeController < ApplicationController
  def index
    @card = Card.find_random_card
  end

  def check_card
    Card.increase_review_date(get_home_params[:id])
    #flash.now[:success] = "Успех! Перевод верен"
    #flash.now[:notice] = "Ошибка! Перевод ошибочный"

  if Card.check_translate(get_home_params[:usertext])
      flash.now[:notice] =  "Успех! Перевод верен"
      render 'success'
    else
      flash.now[:notice] =  "Ошибка! Перевод ошибочный"
      render 'error'
    end
  end

  private

  def get_home_params
    params.require(:home).permit(:id, :usertext)
  end
end
