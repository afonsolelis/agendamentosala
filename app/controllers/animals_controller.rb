class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :set_animal, only: %i[show edit update destroy]

  def index
    @animals = Animal.where(owner: current_user)
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def edit
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.owner = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    redirect_to animals_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:photo,
                                   :specie,
     								               :size,
     								               :location,
     								               :name,
     								               :sex,
      							               :health_castrated,
      						              	 :health_vaccinated,
      							               :health_dewormed,
                                   :health_special,
                                   :description)
  end
end
