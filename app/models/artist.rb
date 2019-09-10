require 'active_support/core_ext/string/inflections'
class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, :through => :songs

    def slug
        name.parameterize
    end

    def self.find_by_slug(str)
       Artist.all.find{|artist| artist.slug == str}
       
    end
end