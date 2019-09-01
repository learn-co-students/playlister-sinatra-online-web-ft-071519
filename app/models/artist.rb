require 'pry'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs 
  
  
  
  # def slug
  #   newarray =[]
  # self.name.split(" ").each do|name|
  #     newarray << name.downcase
  # end
  # newarray = newarray.join("-")
  #   self.slug = newarray
  #   write_attribute(:slug, newarray)
  # end 
  
  # def slug
  # newarray =[]

  #   read_attribute(:name).split(" ").map do|name|
  #     name.downcase
  #   end.join("-")
  # end
  
def name=(name)
      newarray =[]
  name.split(" ").each do|eachname|
      newarray << eachname.downcase
  end
   write_attribute(:name, name)
    newarray = newarray.join("-") 
  write_attribute(:slug, newarray)
  self.save
end
end