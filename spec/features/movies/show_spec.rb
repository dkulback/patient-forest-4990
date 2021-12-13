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
    harrison = Actor.create!(name: 'Harrison Ford', age: 67)
    mike = Actor.create!(name: 'Michael Myers', age: 63)

    visit "/movies/#{movie_1.id}"
    within '.movie' do
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.creation_year)
      expect(page).to have_content(movie_1.genre)
    end
  end
  it 'lists the actors in the movie' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    harrison = Actor.create!(name: 'Harrison Ford', age: 67)
    mike = Actor.create!(name: 'Michael Myers', age: 63)
    movie_1.actors << harrison
    movie_1.actors << mike

    visit "/movies/#{movie_1.id}"
    expected = [mike.name, harrison.name].join(" ")
    expect(page.find_all('.actors').map(&:text).join).to eq(expected)
    within '.actor-age' do
      expect(page).to have_content("Average age: #{Actor.average_age}")
    end
  end
  it 'has a form to add actors to the movie already in DB' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    harrison = Actor.create!(name: 'Harrison Ford', age: 67)
    mike = Actor.create!(name: 'Michael Myers', age: 63)
    # As a user,
    # When I visit a movie show page,
    # I do not see any actors listed that are not part of the movie
    # And I see a form to add an actor to this movie
    # When I fill in the form with the name of an actor that exists in the database
    # And I click submit
    # Then I am redirected back to that movie's show page
    # And I see the actor's name is now listed
    # (You do not have to test for a sad path, for example if the name submitted is not an existing actor)
  end
end
