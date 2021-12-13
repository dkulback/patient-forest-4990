require 'rails_helper'

RSpec.describe 'movies show page' do
  # Story 2
  # Movie Show
  #
  # As a user,
  # When I visit a movie's show page.
  # I see the movie's title, creation year, and genre,
  # and a list of all its actors from youngest to oldest.
  # And I see the average age of all of the movie's actors
  it 'lists movies and attributes' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie_2 = universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
    harrison = actor.create!(name: 'Harrison Ford', age: 67)
    mike = actor.create!(name: 'Michael Myers', age: 63)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_2.creation_year)
    expect(page).to have_content(movie_2.genre)
  end
end
