class ListsController < ApplicationController
#before_action :find_list, only: [:show, :update, :edit, :destroy]

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
  
  def update
    @list = List.find(params[:id])
    if @list.update(title: params[:title],content: params[:content])
      render @list
    else
      render 'Unable to update the list'
    end
  end

  private
  def list_params
    params.require(:list).permit(:title, :content)
  end
end
