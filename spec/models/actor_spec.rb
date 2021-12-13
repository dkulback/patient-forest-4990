require 'rails_helper'

RSpec.describe Actor, type: :model do
  it {should have_many :actor_movies}
  it {should have_many(:movies).through(:actor_movies)}
  describe 'class methods' do
    it 'lists actors from youngest to oldest' do

      harrison = Actor.create!(name: 'Harrison Ford', age: 67)
      mike = Actor.create!(name: 'Michael Myers', age: 63)
      expect(Actor.age_sort).to eq([mike, harrison])
    end
    it 'lists actors average age' do

      harrison = Actor.create!(name: 'Harrison Ford', age: 67)
      mike = Actor.create!(name: 'Michael Myers', age: 63)
      expect(Actor.average_age).to eq(65)
    end
  end
end
