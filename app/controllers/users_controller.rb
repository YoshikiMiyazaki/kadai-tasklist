class UsersController < ApplicationController
  # before_action :require_user_logged_in, only: [:index, :show]
  # def index
  #   @users = User.all.page(params[:page])
  # end

  # def show
  #   @user = User.find(params[:id])
  # end
  before_action :correct_user, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    @user = current_user.tasks.find_by(id: params[:id])
    unless @user
      redirect_to root_url
    end
  end
end
