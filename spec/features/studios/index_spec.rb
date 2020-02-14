require 'rails_helper'

RSpec.describe "studio index page", type: :feature do
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
  end

  scenario "list of all studios and their movies" do
    visit "/studios"

    expect(page).to have_content("#{@astudios.name}")
    expect(page).to have_content("#{@bstudios.name}")
    expect(page).to have_content("#{@cstudios.name}")
    expect(page).to have_content("#{@dstudios.name}")

    within("#studios-#{@cstudios.id}") do
      expect(page).to have_content("#{@actionmovie.name}")
      expect(page).to have_content("#{@romancemovie.name}")
    end

    within("#studios-#{@dstudios.id}") do
      expect(page).to have_content("#{@comedymovie.name}")
      expect(page).to have_content("#{@adventuremovie.name}")
    end
  end
end
