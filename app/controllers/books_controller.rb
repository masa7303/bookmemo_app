class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:new, :create]
  # テストユーザーでログインしている時の制限
  # before_action :if_not_admin, only: [:new, :edit, :create, :update, :destroy]

  def index
    @user = User.find(session[:user_id])
    @books = Book.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(6)
    if params[:title].present?
      @books = @books.get_by_title(params[:title])
    end
  end

  def show
    @user = User.find(session[:user_id])
    @comments = @book.comments
    @comment = Comment.new
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @user = User.find(session[:user_id])
    @book = Book.new(book_params)
    @book.user_id = @user.id
    if @book.save
      redirect_to @book
    else
      render "new"
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @books = Book.search(params[:search])
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :picture, :new_picture, :remove_picture, :user_id)
    end

end
