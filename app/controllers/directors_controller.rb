class DirectorsController < ApplicationController 
  def index
    render({ :template => "directors_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "directors_templates/details" })
  end

  def youngest 
    directors_with_dob = Director.where.not({ :dob => nil })
    find_youngest = directors_with_dob.all.order({ :dob => :desc }) 
    youngest_director = find_youngest.at(0) 
    @director = youngest_director.name 

    @display_dob = youngest_director.dob


    render({ :template => "directors_templates/youngest" })
  end

  def eldest
    directors_with_dob = Director.where.not({ :dob => nil })
    find_eldest = directors_with_dob.all.order({ :dob => :asc }) 
    eldest_director = find_eldest.at(0) 
    @director = eldest_director.name 

    @display_dob = eldest_director.dob


    render({ :template => "directors_templates/eldest" })
  end 

end
