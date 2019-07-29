class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth']) #request.env['omniauth.auth']はTwitter認証で得た情報を格納するもの
    if user
      session[:user_id] = user.id
      session[:name] = user.name
      redirect_to root_path, notice: "ログインしました。"
    else
      redirect_to root_path, notice: "失敗しました。"
    end
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました。"
    redirect_to root_path
  end
end
