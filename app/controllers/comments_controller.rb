class CommentsController < ApplicationController
  protect_from_forgery
  before_action :set_post

  def new
    @comment = Comment.new(posted_at: Time.current)
  end

  def create
    @book.comments.create!(comments_params)
    redirect_to @book
  end

  def destroy
    @book.comments.destroy(params[:id])
    redirect_to @book
  end

    private
      def set_post
        @book = Book.find(params[:book_id])
      end

      def comments_params
        params.required(:comment).permit(:body, :posted_at)
      end
end
