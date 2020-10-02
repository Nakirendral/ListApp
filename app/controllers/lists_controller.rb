class ListsController < ApplicationController
#before_action :find_list, only: [:show, :update, :edit, :destroy]

  def index
    @lists = List.all
  end

  def show

  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list
    # else
    #   render 'new'
    end
  end

  private
  def list_params
    params.require(:list).permit(:title, :content)
  end
end
