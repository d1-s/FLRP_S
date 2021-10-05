class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to post_path(@comment.post.id)
    else
      @post = @comment.post
      @comments = @post.comments
      @q = Post.ransack(params[:q])
      render "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
      redirect_to post_path(comment.post.id)
    else
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
