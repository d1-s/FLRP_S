class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :search_post, only: [:index, :show]

  def index
    @posts = @q.result(distinct: true).includes(:user).order('created_at DESC').page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
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
    @post.destroy
    redirect_to root_path
  end

  def search
    # @results = @q.result(distinct: true)
  end

  private

  def post_params
    params.require(:post).permit(:visit, :restaurant, :category_id, :compartment_id, :reserved_id, :open, :close, :prefecture_id,
                                 :city, :address, :buiding, :budget_id, :image, :introduction).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def search_post
    @q = Post.ransack(params[:q])
  end

end
