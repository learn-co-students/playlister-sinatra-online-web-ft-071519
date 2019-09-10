require 'active_support/core_ext/string/inflections'
class SongGenre < ActiveRecord::Base
belongs_to :song
belongs_to :genre


end