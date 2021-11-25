# frozen_string_literal: true

# app/model/bookmark.rb
class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }, presence: true

  validates :movie, uniqueness: { scope: :list_id, message: 'is already in the list?' }
end
