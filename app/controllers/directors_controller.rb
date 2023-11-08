class DirectorsController < ApplicationController
  def index
    render({:template => "director_templates/list"})
  end

  def show
    director_id = params.fetch("an_id").to_i
    @this_director = Director.all.where(:id == director_id).at(0)

    @film_records = Movie.all.where(:director_id == director_id) 
    render({:template => "director_templates/details"})
  end

end
