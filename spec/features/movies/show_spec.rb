require 'rails_helper'

RSpec.describe "movie show page", type: :feature do
  before(:each) do
    @astudios = Studio.create(name: "astudios")
    @bstudios = Studio.create(name: "bstudios")
    @cstudios = Studio.create(name: "cstudios")
    @dstudios = Studio.create(name: "dstudios")

    @thrillermovie = @astudios.movies.create(name: "thrillermovie", creation_year: 1975, genre: "thriller")
    @horrormovie = @astudios.movies.create(name: "horrormovie", creation_year: 1993, genre: "horror")
    @scifimovie = @bstudios.movies.create(name: "scifimovie", creation_year: 1975, genre: "scifi")
    @dramamovie = @bstudios.movies.create(name: "dramamovie", creation_year: 1993, genre: "drama")
    @actionmovie = @cstudios.movies.create(name: "actionmovie", creation_year: 1985, genre: "action")
    @romancemovie = @cstudios.movies.create(name: "romancemovie", creation_year: 2013, genre: "romance")
    @comedymovie = @dstudios.movies.create(name: "comedymovie", creation_year: 1975, genre: "comedy")
    @adventuremovie = @dstudios.movies.create(name: "adventuremovie", creation_year: 1993, genre: "adventure")

    @actor1 = Actor.create(name: "Thomas Ngijol", age: 41)
    @actor2 = Actor.create(name: "Fabrice Eboue", age: 42)
    @actor3 = Actor.create(name: "Aissa Maiga", age: 44)

    ActorMovie.create(actor_id: @actor1.id, movie_id: @thrillermovie.id)
    ActorMovie.create(actor_id: @actor1.id, movie_id: @horrormovie.id)
    ActorMovie.create(actor_id: @actor1.id, movie_id: @scifimovie.id)
    ActorMovie.create(actor_id: @actor1.id, movie_id: @dramamovie.id)
    ActorMovie.create(actor_id: @actor2.id, movie_id: @horrormovie.id)
    ActorMovie.create(actor_id: @actor2.id, movie_id: @dramamovie.id)
    ActorMovie.create(actor_id: @actor2.id, movie_id: @actionmovie.id)
    ActorMovie.create(actor_id: @actor2.id, movie_id: @romancemovie.id)
    ActorMovie.create(actor_id: @actor3.id, movie_id: @comedymovie.id)
    ActorMovie.create(actor_id: @actor3.id, movie_id: @adventuremovie.id)
    ActorMovie.create(actor_id: @actor3.id, movie_id: @actionmovie.id)
    ActorMovie.create(actor_id: @actor3.id, movie_id: @thrillermovie.id)
  end

  scenario "movies name, creation year and genre" do
    visit "/movies/#{@actionmovie.id}"

    expect(page).to have_content(@actionmovie.name)
    expect(page).to have_content(@actionmovie.creation_year)
    expect(page).to have_content(@actionmovie.genre)
  end

  scenario "list of all actors from youngest to oldest" do
    visit "/movies/#{@thrillermovie.id}"

    expect(page).to have_content("Featured Actors: Thomas Ngijol Aissa Maiga")
  end

  scenario "average age of all the movie's actors" do
    visit "/movies/#{@actionmovie.id}"

    expect(page).to have_content("Actors' Average Age: 43")
  end

end
