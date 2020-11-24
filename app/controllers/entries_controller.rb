class EntriesController < ApplicationController
  #before_action :find_entry, only: [:show, :update, :edit, :destroy]
  #before_action :find_list, only: [:show, :update, :edit, :destroy]

  def index
    @list = List.find_by_id(params[:list_id])
    @entries = Entry.all.order("created_at DESC")
  end

  def show
    @entry = Entry.find_by_id(entry_params[:id])
    @list = List.find_by_id(entry_params[:list_id])
  end

  def edit
    @entry = Entry.find_by_id(params[:id])
    @list = List.find_by_id(params[:list_id])
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
    @list = List.find_by_id(params[:list_id])
    @entry.list = @list
    if @entry.save!
      #Rails convention - doesn't do anything but it does enforce bangers - for mutators
      # things that change state
      #Also used in this case for validation - when saving to db, will do 2 things, errors will not silently fail!
      render 'show'
    else
      # throw an error
     render 'new'
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:content, :score)
  end
end
