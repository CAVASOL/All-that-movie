# frozen_string_literal: true

# app/model/bookmark.rb
class Bookmark < ApplicationRecord
  belongs_to :movie # allow_blank: false
  belongs_to :list, dependent: :destroy # allow_blank: false

  validates :comment, length: { minimum: 6 }, presence: true

  validates :movie, uniqueness: { scope: :list }
end
