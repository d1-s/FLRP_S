class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @q = @user.posts.ransack(params[:q])
    @posts = @q.result(distinct: true).order('created_at DESC').page(params[:page]).per(5)
  end
end
