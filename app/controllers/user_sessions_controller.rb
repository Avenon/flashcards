class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Вы успешно вошли')
    else
      flash.now[:alert] = 'Неверный логин'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Вы вышли из системы!')
  end
end
