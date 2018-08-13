class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :request_path

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end



  def admin_user
    redirect_to(porpos_path) unless current_user.admin?
  end

  def request_path
      @path = controller_path + '#' + action_name
      def @path.is(*str)
          str.map{|s| self.include?(s)}.include?(true)
      end
  end
end
