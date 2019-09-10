require 'active_support/core_ext/string/inflections'
class Genre < ActiveRecord::Base
 has_many :song_genres
 has_many :songs, through: :song_genres
 has_many :artists, through: :songs

    def slug
        name.parameterize
    end

    def self.find_by_slug(str)
       Genre.all.find {|genre| genre.slug == str}
    end
end