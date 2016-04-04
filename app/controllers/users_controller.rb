class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(get_user_params)

    if @user.save
      login(params[:user][:email], params[:user][:password])
       redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update(get_user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  def set_user
      @user = User.find(params[:id])
    end

  def get_user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
