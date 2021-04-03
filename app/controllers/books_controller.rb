class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to 'books/:id'
    # redirect_to '/books/:id' # !bookのshowページに遷移したいがエラーになる!
    # フラッシュメッセージ
    # @message = @book.messages.new(message_params)
    # if @message.save
      # redirect_to '/books/:id' #, notice: 'successfully'
    # else
      # flash.now[:alert] = 'error'
      # render :index
    # end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

# ストロングパラメータを設定
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end