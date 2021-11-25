# frozen_string_literal: true

# app/model/list.rb
class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews

  validates :name, uniqueness: true, presence: true
end
