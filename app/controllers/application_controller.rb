class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end

  def correct_user
    @user = User.friendly.find(params[:id])
    redirect_to(porpos_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(porpos_path) unless current_user.admin?
  end
end
