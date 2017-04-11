class SongsController < ApplicationController
    def index
      @songs = Song.all
    end

    def show # get '/songs/:id'
      song_setter
    end

    def new # get '/songs/new'
      @song = Song.new
    end

    def edit # get '/songs/:id/edit'
      song_setter
    end

    def create # post '/songs'
      @song = Song.create( song_params )
      redirect_to( song_path( @song ) )
    end

    def update # patch/put '/songs/:id'
      song_setter
      @song.update( song_params )
      redirect_to( song_path( @song ) )
    end

    private
      def song_setter
        @song = Song.find( params.require( :id ) )
      end

      def song_params
        params.require( :song ).permit( :name, :artist_id, :genre_id )
      end
end
