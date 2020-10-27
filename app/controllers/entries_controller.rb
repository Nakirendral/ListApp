class EntriesController < ApplicationController
  #before_action :find_entry, only: [:show, :update, :edit, :destroy]
  #before_action :find_list, only: [:show, :update, :edit, :destroy]

  def index
    @list = List.find_by_id(params[:list_id])
    @entries = Entry.all.order("created_at DESC")
  end

  def show
    @entry = Entry.find_by_id(params[:id])
    @list = List.find_by_id(params[:list_id])
  end

  def edit
    @entry = Entry.find_by_id(params[:id])
    @list = List.find_by_id(params[:list_id])
  end

  def update 
    @entry = Entry.find_by_id(params[:id])
    if @entry.update_attributes(entry_params)
      redirect_to entry: :index
      flash[:notice] = "Entry was updated."
    else
      render 'edit'
    end
  end

  def new
    @list = List.find_by_id(params[:list_id])
    @entry = Entry.new
  end

  def create
    @list = List.find_by_id(params[:list_id])
    @entry = Entry.new(entry_params)

    if @entry.save!
      redirect_to list_entry_url(@list, @entry)
    else
     render 'new'
    end
  end

  private
  def entry_params
    params.permit(:content, :list_id, :score, :id)
  end
end
