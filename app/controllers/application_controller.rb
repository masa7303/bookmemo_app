class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user, :logged_in?, :authenticate, :if_not_admin
  # before_action :current_user

    def current_user
      # session[:user_id]がnilの場合はreturnする
      return unless session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def authenticate
      return if logged_in?
      redirect_to root_path, alert: "ログインしてください"
    end

    # テストユーザーの時は、トップページへリダイレクトする
    def if_not_admin
      if session[:testuser] == 1 
        redirect_to root_path
      end
    end

end
