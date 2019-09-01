class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs 
  
  
  
  def slugify
    newarray =[]
   self.name.split(" ").each do|name|
      newarray << name.downcase
   end
   
   self.slug = newarray.join("-")
  end 
  
end