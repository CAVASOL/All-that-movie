# frozen_string_literal: true

# app/controller/lists_controller.rb
class ListsController < ApplicationController

  def all
    @lists = List.all
  end

  def new

  end

  def post
  end

  def destroy
  end

end
