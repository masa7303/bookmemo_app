class CommentsController < ApplicationController
  protect_from_forgery
  before_action :set_post, except: [:index]
  before_action :current_user, only: [:new, :create]
  # テストユーザーでログインしている時の制限
  before_action :if_not_admin, only: [:new, :create, :destroy]

  def new
    @comment = Comment.new(posted_at: Time.current, book_title: @book[:title])
  end

  def create
    @user = User.find(session[:user_id])
    @comment = @book.comments.build(comments_params)
    @comment.book_title = @book.title
    @comment.user_id = @user.id
    @comment.save
    #@book.comments.create!(comments_params).merge(:book_title => "#{@book.title}"))
    redirect_to @book
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to @book
  end

  def index
    @comments = Comment.where(user_id: current_user.id)
    # 今日書いた記録
    @comments1 = @comments.created_today.order(posted_at: :desc)
    # 昨日書いた記録
    @comments2 = @comments.created_yesterday.order(posted_at: :desc)
    # 三日前に書いた記録
    @comments3 = @comments.created_three_days_ago
    # 一週間前に書いた記録
    @comments4 = @comments.created_a_week_ago.order(posted_at: :desc)
    # 一ヶ月前に書いた記録
    @comments5 = @comments.created_a_month_ago.order(posted_at: :desc)

    @favoritecomments = @comments1 + @comments2 + @comments3 + @comments4 + @comments5
  end

    private
      def set_post
        @book = Book.find(params[:book_id])
      end

      def comments_params
        params.required(:comment).permit(:body, :posted_at, :book_id, :book_title)
      end

end
