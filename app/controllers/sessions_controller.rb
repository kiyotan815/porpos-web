class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "ログインが完了しました"
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレス、またはパスワードが一致しません' 
      render 'new'
    end
  end

  def destroy
  end
end
