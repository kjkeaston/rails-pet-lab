class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.create(owner_params)
    if owner.save
      redirect_to owner_path(owner)
    else
      flash[:error] = owner.errors.full_messages.join(", ")
      redirect_to new_owner_path
    end
  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    @owner = Owner.find_by_id(params[:id])
  end

  def update
    owner = Owner.find_by_id(params[:id])
    owner.update_attributes(owner_params)
    if owner.save
      redirect_to owner_path(owner)
    else
      flash[:error] = owner.errors.full_messages.join(", ")
      redirect_to edit_owner_path
    end
  end

  def destroy
    # stretch
  end

  # TODO: add custom appointments action for convenience

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end

end
