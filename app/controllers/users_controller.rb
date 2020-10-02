class UsersController < ApplicationController

  def index
    @users = User.all.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @post.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:userid, :username, :email, :first_name, :last_name)
  end
end
