# frozen_string_literal: true

# app/controller/lists_controller.rb
class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show; end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  # def update
  #   if @bookmark.update(bookmark_params)
  #     redirect_to movie_path(@movie)
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @list.destroy
  #   redirect_to list_path(@list.bookmark)
  # end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
