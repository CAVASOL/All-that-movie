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

  def search
    if param[:query].present?
      # @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
      url = "http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7"
      movies = JSON.parse(open(url).read)['Search']
      movies.each do |movie|
        Movie.create(
          title: movie['Title'],
          poster_url: movie['Poster']
        )
      end

      @movies = Movie.last(movies.length)
    end
  end



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
