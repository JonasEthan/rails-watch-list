class BookmarksController < ApplicationController
  def index
    redirect_to new_list_bookmark_path(params[:list_id])
  end

  def new
    @bookmark = Bookmark.new(list_id: params[:list_id])
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:list_id, :movie_id, :comment)
  end
end
