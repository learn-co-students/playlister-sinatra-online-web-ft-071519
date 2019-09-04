require 'pry'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index' 
  end
  
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index' 
  end
  
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index' 
  end
  
  get '/songs/new' do
    @genre=Genre.all
 
    erb :'/songs/new' 
  end
  
  post '/songs/new' do
    @song = Song.create(name: params[:song_name])
    if Artist.find_by_name(params[:Artist_name])==nil
        @artist=Artist.create(name: params[:Artist_name])
        @song.artist = @artist
        @song.save
    else
      @song.artist = Artist.find_by_name(params[:Artist_name])
      @song.save
    end
    @genresArray = Genre.find_by_id(params[:genres][0])
    @song.genres << @genresArray
    
    redirect "/songs/#{@song.slug}" 
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @songGenres = @song.genres
    erb :show
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
  
  
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genre=Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/edit' do
    @song = Song.find_by_name(params[:song_name])
    if params[:Artist_name] != ""
      binding.pry
      @artist=Artist.create(name: params[:Artist_name])
      @song.update(artist: @artist)
    end
    if params[:genres]
      @song.genres.clear
      @genresArray = Genre.find_by_id(params[:genres][0])
      @song.genres << @genresArray
    end
    @song.save
    redirect "/songs/#{@song.slug}" 
  end
end