class MoviesController < ApplicationController
  def index
    render({:template => "movie_templates/list"})
  end

  def show
    movie_id = params.fetch("the_id")
    matching_records = Movie.where(:id => movie_id)
    @this_movie = matching_records.at(0)
    
    render({:template => "movie_templates/details"})
  end
end
