class ReclucksController < ApplicationController
  def create
    cluck = Cluck.find(params[:cluck])
    recluck = Recluck.create(user: current_user, cluck: cluck)
    redirect_to clucks_path
  end
end
