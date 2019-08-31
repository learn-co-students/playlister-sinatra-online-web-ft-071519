class Genre < ActiveRecord::Base
  
  has_many :artists 
  has_many :songGenre
  has_many :songs, through: :songGenre
end