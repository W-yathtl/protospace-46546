class PrototypesController < ApplicationController
  def index
    # すべてのプロトタイプを取得
    # 投稿者(User)と画像(ActiveStorage)をまとめて取得してN+1問題を防ぐ
    @prototypes = Prototype.all.includes(:user, image_attachment: :blob)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "プロトタイプを投稿しました"
    else
      render :new
    end
  end

  def show
       @prototype = Prototype.find(params[:id]) 
       @comment = Comment.new
  end
  
def edit
  @prototype = Prototype.find(params[:id])
  unless user_signed_in? && current_user.id == @prototype.user_id
    redirect_to root_path, alert: "編集権限がありません"
  end
end
  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: "プロトタイプを更新しました"
    else
     render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path, notice: "プロトタイプを削除しました"
    else
      render :show, status: :unprocessable_entity
    end
  end
  private

  # ストロングパラメーター
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end