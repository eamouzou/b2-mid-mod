require 'rails_helper'

RSpec.describe "studio index page", type: :feature do
  before(:each) do

  end

  scenario "list of all studios and their movies" do
    visit "/studios"

    expect(page).to have_content("#{@astudios.name}")
    expect(page).to have_content("#{@bstudios.name}")
    expect(page).to have_content("#{@cstudios.name}")
    expect(page).to have_content("#{@dstudios.name}")

    within("#studios-#{@cstudios.id}") do
      expect(page).to have_content("#{@actionmovie.name}")
    end

    within("#studios-#{@dstudios.id}") do
      expect(page).to have_content("#{@comedymovie.name}")
    end

  end
end
