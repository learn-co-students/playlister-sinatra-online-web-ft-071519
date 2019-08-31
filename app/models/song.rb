class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :songGenre
  has_many :genres, through: :songGenre 
end