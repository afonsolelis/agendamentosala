class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @animals = Animal.all
  end

  def search
  	specie_params = params[:specie]
  	@animals = Animal.all.where(specie: specie_params)
  end
end
