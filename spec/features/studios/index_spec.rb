require 'rails_helper'

RSpec.describe 'studio index page', type: :feature do
  # Studio Index
  #
  # As a user,
  # When I visit the studio index page
  # I see a each studio's name and location
  # And underneath each studio, I see the titles of all of its movies.
  it 'lists each studio and attributes' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    movie_1 = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie_2 = universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
    visit '/studios'
    within '.studio' do
      expect(page).to have_content(universal.name)
    end
    within '.movies' do
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
    end
  end
end
