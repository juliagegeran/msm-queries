class ActorsController < ApplicationController
  def index
    render({:template => "actor_templates/list"})
  end

  def show
    actor_id = params.fetch("the_id")
    actor_profiles = Actor.where(:id => actor_id)
    @this_actor = actor_profiles.at(0)
    @all_characters = Character.where(:actor_id => actor_id)
    render({:template => "actor_templates/details"})
  end
end
