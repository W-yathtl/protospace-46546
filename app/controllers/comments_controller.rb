class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params.merge(user_id: current_user.id))

    if @comment.save
      redirect_to prototype_path(@prototype), notice: "コメントを投稿しました"
    else
      render 'prototypes/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    # 絶対に :content のみを許可する
    params.require(:comment).permit(:content)
  end
end
