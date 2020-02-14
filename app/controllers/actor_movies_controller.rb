class ActorMoviesController < ApplicationController
  def create
    actor = Actor.where(name: params[:actor_name])
    ActorMovie.create(actor_id: actor.first.id, movie_id: params[:movie_id])
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
