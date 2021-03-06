class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update]
  before_action :correct_user,   only: %i[edit update]
  before_action :admin_user,     only: %i[:destroy]

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
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "アカウント情報の編集が完了しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:success] = "削除が完了しました"
    redirect_to users_index_path
  end

  def show
    @user = User.friendly.find(params[:id])
    @portfolios = @user.portfolios.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon_img)
  end

  def correct_user
    @user = User.friendly.find(params[:id])
    redirect_to porpos_path unless current_user?(@user)
  end
end
