class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:visit, :restaurant, :category_id, :private_id, :reserved_id, :open, :close,
                                 :address, :budget_id, :image, :introduction).merge(user_id: current_user.id)
  end
  
end
