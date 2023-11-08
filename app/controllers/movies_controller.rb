class MoviesController < ApplicationController

  def show
    movie_id = params.fetch("an_id").to_i

    @this_movie = Movie.all.where(:id == movie_id).at(0)

    render({:template => "movie_templates/details"})
  end
end
