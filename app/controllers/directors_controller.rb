class DirectorsController < ApplicationController
  def index
    render({:template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    if the_id == "youngest"
      directors_w_dob = Director.all.where.not({:dob => nil})
      @youngest = directors_w_dob.all.order({:dob => :asc}).last
      render({:template => "director_templates/youngest"})
    
    elsif the_id =="eldest"
      directors_w_dob = Director.all.where.not({:dob => nil})
      @eldest = directors_w_dob.all.order({:dob => :asc}).first
      render({:template => "director_templates/eldest"})
    
    else
      matching_records = Director.where({ :id => the_id })  
      @this_director = matching_records.at(0)  
      render({ :template => "director_templates/details" })
    end
    
  end

end
