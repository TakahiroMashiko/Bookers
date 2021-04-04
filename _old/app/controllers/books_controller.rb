class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    # 投稿処理の成功後、サクセスメッセージを表示
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      @books=Book.all
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    # 更新処理の成功後、サクセスメッセージを表示
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      @books=Book.all
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    # 削除処理の成功後、サクセスメッセージを表示
    if @book.destroy
      redirect_to books_path(@book), notice: "Book was successfully destroyed."
      # flash[:notice] = "Book was successfully destroyed." !この書き方でもOK!
      # redirect_to books_path(@book) !この書き方でもOK!
    end
  end

# ストロングパラメータを設定
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end