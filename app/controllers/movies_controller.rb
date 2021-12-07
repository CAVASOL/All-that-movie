# frozen_string_literal: true

require 'open-uri'
require 'faker'
# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    if params[:query].present?
      url = "http://www.omdbapi.com/?s=#{params[:query]}&apikey=adf1f2d7"
      body = URI.open(url).read
      movies = JSON.parse(body)['Search']

      @movies = movies.map do |movie|
        m = Movie.new(
          title: movie['Title'],
          poster_url: movie['Poster'],
          overview: Faker::Movie.quote,
          rating: rand(1..10)
        )
      end
    else
      @movies = Movie.all
    end
  end
end
