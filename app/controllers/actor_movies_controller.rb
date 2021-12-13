class ActorMoviesController < ApplicationController
  def create
    movie = Movie.find(params[:id])
    movie.actors << Actor.where(name: params[:search])
    redirect_to "/movies/#{movie.id}"
  end

  private
  def actor_params
  params.require(:actor).permit(:name, :age)
  end
end
