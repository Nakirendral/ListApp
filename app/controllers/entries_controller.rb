class EntriesController < ApplicationController
  #before_action :find_entry, only: [:show, :update, :edit, :destroy]
  #before_action :find_list, only: [:show, :update, :edit, :destroy]

  def index
    @entries = Entry.all.order("created_at DESC")
  end

  def show
    @entry = Entry.find_by_id(params[:id])
    @list = @entry.list
  end

  def edit
    @entry = Entry.find_by_id(params[:id])
    @list = @entry.list
  end

  def update 
    @entry = Entry.find_by_id(params[:id])
    @list = @entry.list
    if @entry.update_attributes(entry_params)
      redirect_to entry: :index
      flash[:notice] = "Entry was updated."
    else
      render 'edit'
    end
  end

  def new
    @entry = Entry.new
    @list = List.find_by_id(params[:list_id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.list = List.find_by_id(params[:list_id])
    if @entry.save!
      #Rails convention - doesn't do anything but it does enforce bangers - for mutators
      # things that change state
      #Also used in this case for validation - when saving to db, will do 2 things, errors will not silently fail!
      redirect_to @entry
    else
     render 'new'
    end
  end

  private
  def entry_params
    params.permit(:content, :list_id, :score, :id)
  end
end
