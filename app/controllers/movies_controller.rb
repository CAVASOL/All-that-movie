# frozen_string_literal: true

# app/controller/movies_controller.rb
class MoviesController < ApplicationController
  def all
    @movies = Movie.all
  end

  def new

  end

  def post
  end

  def destroy
  end

end
