class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.age_sort
    order(:age)
  end

  def self.average_age
     average(:age).to_i
  end
end
