class ListsController < ApplicationController
#before_action :find_list, only: [:show, :update, :edit, :destroy]

  def index
    #@lists = List.all.order("created_at DESC")
  end

  def new

  end

  def create
  
  end
end
