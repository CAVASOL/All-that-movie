# frozen_string_literal: true

# app/model/movie.rb
class Movie < ApplicationRecord
  has_many :bookmarks

  validates :overview, presence: true
  validates :poster_url, presence: true, allow_blank: true
  validates :title, uniqueness: true, presence: true
  validates :rating, presence: true, allow_blank: true
end
