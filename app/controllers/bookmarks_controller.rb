# frozen_string_literal: true

# app/controller/bookmarks_controller.rb
class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy, :edit, :update]
  before_action :set_list, only: %i[new create]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def edit; end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to list_path(@bookmark.list)
    else
      render 'edit'
    end
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    list_id = params[:list_id]
    @list = List.find(list_id)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @lsit = List.find(params[:list_id])
  end
end
