class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

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

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:visit, :restaurant, :category_id, :compartment_id, :reserved_id, :open, :close,
                                 :address, :budget_id, :image, :introduction).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
  
end
