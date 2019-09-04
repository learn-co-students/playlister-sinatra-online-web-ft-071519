class Genre < ActiveRecord::Base
  
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  
 
  has_many :artists , through: :songs
 
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