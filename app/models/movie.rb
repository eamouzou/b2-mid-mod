class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def get_sorted_actors
    actors.order(:age)
  end

  def actors_avg_age
    actors.average(:age).to_i
  end
end
