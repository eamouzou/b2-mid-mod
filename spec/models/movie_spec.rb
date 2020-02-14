require 'rails_helper'


RSpec.describe Movie, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :creation_year}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :actor_movies}
    it {should have_many(:actors).through(:actor_movies)}
  end

  before(:each) do
    @astudios = Studio.create(name: "astudios")
    @cstudios = Studio.create(name: "cstudios")
    @thrillermovie = @astudios.movies.create(name: "thrillermovie", creation_year: 1975, genre: "thriller")
    @actionmovie = @cstudios.movies.create(name: "actionmovie", creation_year: 1985, genre: "action")
    @actor1 = Actor.create(name: "Thomas Ngijol", age: 41)
    @actor2 = Actor.create(name: "Fabrice Eboue", age: 42)
    @actor3 = Actor.create(name: "Aissa Maiga", age: 44)

    ActorMovie.create(actor_id: @actor1.id, movie_id: @thrillermovie.id)
    ActorMovie.create(actor_id: @actor2.id, movie_id: @actionmovie.id)
    ActorMovie.create(actor_id: @actor3.id, movie_id: @actionmovie.id)
    ActorMovie.create(actor_id: @actor3.id, movie_id: @thrillermovie.id)
  end

  it ".get_sorted_actors"  do
    expect(@thrillermovie.get_sorted_actors).to eq([@actor1, @actor3])
  end

  it ".actors_avg_age" do
    expect(@actionmovie.actors_avg_age).to eq(43)
  end
end
