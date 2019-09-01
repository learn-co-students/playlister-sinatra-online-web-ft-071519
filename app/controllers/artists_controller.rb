class SongsController < ApplicationController
  
  get '/artists' do
    @songs = Artist.all
    erb :'/artists/index' 
  end
end
