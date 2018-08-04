class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "登録が完了しました"
      redirect_to @user  
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "アカウント情報の編集が完了しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  def show 
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(porpos_path) unless current_user?(@user)
  end
end
