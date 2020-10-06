class UsersController < ApplicationController
#before_action :find_user, only: [:show, :update, :edit, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def update
    @user = User.update
  end

  def edit
    @user.find(user_params.id)

    if @user.save
      redirect_to @user
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end 

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    # else
    #   render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to new_users_path
  end

  private
  def user_params
    params.require(:user).permit(:id, :username, :email, :first_name, :last_name)
  end
end
