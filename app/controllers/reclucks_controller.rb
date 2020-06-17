class ReclucksController < ApplicationController
  def create
    cluck = Cluck.find(params[:cluck])
    recluck = Recluck.create(user: current_user, cluck: cluck)
    redirect_to clucks_path
  end

  def destroy
    recluck = Recluck.find_by(cluck: params[:id])
    recluck.delete
    redirect_to users_cluck_path(current_user)
  end
end
