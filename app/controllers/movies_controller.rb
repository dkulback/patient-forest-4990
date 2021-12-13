class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def create
    require "pry"; binding.pry
  end
end
