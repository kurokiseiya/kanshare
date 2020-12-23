class DosController < ApplicationController
  def new
    @do = Do.new
    @do_user = current_user
  end

  def create
    @do = Do.new(do_params)
    @do.user_id = current_user.id
    if @do.save
      flash[:do_new_success] = "投稿が完了しました！"
      redirect_to dos_path
    else
      flash[:do_new_alert] = "1文字以上300文字以内の文章を投稿してください。"
      redirect_to new_do_path
    end
  end

  def index
    @dos = Do.all.order(id: "DESC")
  end

  def show
    @do = Do.find(params[:id])
    @do_comment = DoComment.new
  end

  def destroy
    @do = Do.find(params[:id])
    if @do.destroy
      flash[:do_destroy_success] = "TODOの削除を完了しました！"
      redirect_to dos_path
    else
      flash[:do_destroy_alert] = "TODOの削除に失敗しました！"
      redirect_to do_path(@do.id)
    end
  end
  
  def edit
    @do = Do.find(params[:id])
    @do_user = current_user
  end
  
  def update
    @do = Do.find(params[:id])
     if @do.update(do_params)
       flash[:do_edit_success] = "更新に成功しました！"
       redirect_to dos_path
     else
       flash[:do_edit_alert] = "更新に失敗しました！"
       redirect_to edit_do_path(@do.id)
     end
  end
  
  private
  def do_params
    params.require(:do).permit(:do_text)
  end
end
