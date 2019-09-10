require 'active_support/core_ext/string/inflections'
class Song < ActiveRecord::Base
    belongs_to :artist 
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        name.parameterize
    end

    def self.find_by_slug(str)
       Song.all.find {|song| song.slug == str}
    end

end