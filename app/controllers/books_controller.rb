class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:new, :create]

  # GET /books
  # GET /books.json
  def index
    @user = User.find(session[:user_id])
    @books = Book.order(created_at: :desc).page(params[:page]).per(6)
    if params[:title].present?
      @books = @books.get_by_title(params[:title])
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @user = User.find(session[:user_id])
    @comments = @book.comments
    @comment = Comment.new
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
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

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
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

  # DELETE /books/1
  # DELETE /books/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :picture, :new_picture, :remove_picture, :user_id)
    end
end
