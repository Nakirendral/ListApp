class UsersController < ApplicationController

  def index
    @lists = List.all.order("created_at DESC")
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @post.save
      redirect_to @list
    else
      render 'new'
    end
  end

  private
  def list_params
    params.require(:list).permit(:title, :content)
  end
end
