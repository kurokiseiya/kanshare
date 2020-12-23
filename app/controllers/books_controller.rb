class BooksController < ApplicationController
  def index
    @books = Book.all.order(id: "DESC")
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:book_new_success] = "投稿に成功しました！"
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:book_edit_success] = "更新に成功しました！"
      redirect_to book_path(book.id)
    else
      flash[:book_edit_alert] = "更新に失敗しました！"
      redirect_to edit_book_path
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:book_destroy_success] = "MYBOOKを削除しました！"
      redirect_to books_path
    else
      flash[:book_destroy_alert] = "MYBOOKを削除できませんでした！"
      redirect_to book_path(@book.id)
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:book_title, :book_subtitle, :book_image, :book_url, :book_caption)
  end
end
