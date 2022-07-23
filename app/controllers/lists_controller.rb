class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    #@bookmark = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end

  def destroy
    @list = List.find(params[:list_id])
    @list.destroy
    redirect_to lists_path
  end
end
