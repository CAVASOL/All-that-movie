# frozen_string_literal: true

# app/controller/lists_controller.rb
class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

# def search
#  @movies = movie.where(title: params[:query])
#   url = `https://www.imdb.com/find?q=#{query}&ref_=nv_sr_sm`
#   movies = JSON.parse(open("#{query}?page=1").read)['results']
#   movies.each do |movie|
#     base_poster_url = `https://www.imdb.com/find?q=#{query}&ref_=nv_sr_sm`
#     Movie.create(
#       title: movie['title']
#     )
#   end
# end

  def show
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
