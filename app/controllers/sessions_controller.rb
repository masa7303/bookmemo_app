class SessionsController < ApplicationController

  def create
    # request.env['omniauth.auth']はTwitter認証で得た情報を格納するもの
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    # 情報がある時は格納しトップページへリダイレクト
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました。"
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました。"
    redirect_to root_path
  end

  # テストユーザーログイン時の処理
  def testuser
    user = User.find_or_create_from_auth_hash(uid: "ENV['TESTLOGIN_ID']", provider: 'twitter', name: 'テストユーザー')
    session[:user_id] = user.id
    session[:testuser] = 1
    redirect_to root_path, notice: "ログインしました。"
  end

end
