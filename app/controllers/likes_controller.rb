class LikesController < ActionController::API
  before_action :current_user
  before_action :set_comment

  def like
      if @current_user.likes?(@comment)
        render json: !@current_user.unlike!(@comment)
      else
        render json: @current_user.like!(@comment)
      end
  end

  private

   def set_comment
     @comment = Comment.find(params[:id])
   end

   def current_user
     # session[:user_id]がnilの場合はreturnする
     return unless session[:user_id]
     @current_user ||= User.find(session[:user_id])
   end
end
