require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :songGenre
  has_many :genres, through: :songGenre 
  # attr_accessor :genre_ids

  def slug
    newarray =[]
  self.name.split(" ").each do|name|
      newarray << name.downcase
  end
  newarray = newarray.join("-")

  end 
  

def self.find_by_slug(slugyname)
  self.all.find do |i| 
    i.slug == slugyname
  end

end
end