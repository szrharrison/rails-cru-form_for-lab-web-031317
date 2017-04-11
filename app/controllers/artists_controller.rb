class ArtistsController < ApplicationController

  def show # get '/artists/:id'
    artist_setter
  end

  def new # get '/artists/new'
    @artist = Artist.new
  end

  def edit # get '/artists/:id/edit'
    artist_setter
  end

  def create # post '/artists'
    @artist = Artist.create( artist_params( :name, :bio ) )
    redirect_to( artist_path( @artist ) )
  end

  def update # patch/put '/artists/:id'
    artist_setter
    @artist.update( artist_params( :name, :bio ) )
    redirect_to( artist_path( @artist ) )
  end

  private
    def artist_setter
      @artist = Artist.find( params.require( :id ) )
    end

    def artist_params( *args )
      params.require( :artist ).permit( *args )
    end
end
