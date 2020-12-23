class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      flash[:success_comment] = "コメントを作成しました！"
      redirect_to book_path(book)
    else
      flash[:alert_comment] = "1文字以上300字以内でコメントを作成してください。"
      redirect_to book_path(book)
    end
  end

  def destroy
    if BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
      flash[:destroy_comment] = "コメントの削除を完了しました！"
      redirect_to book_path(params[:book_id])
    else
      flash[:destroy_comment_alert] = "コメントの削除ができませんでした！"
      redirect_to book_path(params[:book_id])
    end
  end
  
  private 
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
