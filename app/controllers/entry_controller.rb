class EntryController < ApplicationController
  #before_action :find_entry, only: [:show, :update, :edit, :destroy]

  def index
    @entries = Entry.all.order("created_at DESC")
  end

  def show
    @entry = Entry.find_by_id(params[:id])
  end

  def edit
    @entry = Entry.find_by_id(params[:id])
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
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry
    else
     render 'new'
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:content, :list_id, :score, :id)
  end
end
