class GenresController < ApplicationController

    def show # get '/artists/:id'
      genre_setter
    end

    def new # get '/artists/new'
      @genre = Genre.new
    end

    def edit # get '/genres/:id/edit'
      genre_setter
    end

    def create # post '/genres'
      @genre = Genre.create( genre_params( :name ) )
      redirect_to( genre_path( @genre ) )
    end

    def update # patch/put '/genres/:id'
      genre_setter
      @genre.update( genre_params( :name ) )
      redirect_to( genre_path( @genre ) )
    end

    private
      def genre_setter
        @genre = Genre.find( params.require( :id ) )
      end

      def genre_params( *args )
        params.require( :genre ).permit( *args )
      end
end
