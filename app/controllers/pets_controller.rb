class PetsController < ApplicationController

  def index
    @owner = Owner.find_by_id(params[:owner_id])
  end

  def show
    @pet = Pet.find_by_id(params[:id])
    @owner = Owner.find_by_id(params[:owner_id])
  end

  def new
    @owner = Owner.find_by_id(params[:owner_id])
    @pet = Pet.new
  end

  def create
    pet = Pet.create(pet_params)
    if pet.save
      redirect_to pet_path(pet)
    end
  end

  # TODO: handle save errors and communicate issues to user

  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
