class UsersController < ApplicationController
  def show
    @q = Post.ransack(params[:q])
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:user).order('created_at DESC').page(params[:page]).per(5)
  end
end
