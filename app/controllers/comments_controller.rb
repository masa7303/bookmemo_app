class CommentsController < ApplicationController
  protect_from_forgery
  before_action :set_post, except: [:index]

  def new
    @comment = Comment.new(posted_at: Time.current, book_title: @book[:title])
  end

  def create
    @comment = @book.comments.build(comments_params)
    @comment.book_title = @book.title
    @comment.save
    #@book.comments.create!(comments_params).merge(:book_title => "#{@book.title}"))
    redirect_to @book
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to @book
  end

  def index
    @comments = Comment.all
    # 今日書いた記録
    @comments1 = @comments.created_today.order(posted_at: :desc)
    # 昨日書いた記録
    @comments2 = @comments.created_yesterday.order(posted_at: :desc)
    # 三日前に書いた記録
    @comments3 = @comments.created_three_days_ago.order(posted_at: :desc)
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
