class DoCommentsController < ApplicationController
  def create
    todo = Do.find(params[:do_id])
    do_comment = current_user.do_comments.new(do_comment_params)
    do_comment.do_id = todo.id
    if do_comment.save
      flash[:do_comment_success] = "コメントを作成しました！"
      redirect_to do_path(todo)
    else
      flash[:do_comment_alert] = "1文字以上300字以内でコメントを作成してください。"
      redirect_to do_path(todo)
    end
  end

  def destroy
    if DoComment.find_by(id: params[:id], do_id: params[:do_id]).destroy
      flash[:do_comment_destroy_success] = "コメントの削除が完了しました！"
      redirect_to do_path(params[:do_id])
    else
      flash[:do_comment_destroy_alert] = "コメントの削除が失敗しました！"
      redirect_to do_path(params[:do_id])
    end
  end
  
  private
  def do_comment_params
    params.require(:do_comment).permit(:todo_comment)
  end
end
