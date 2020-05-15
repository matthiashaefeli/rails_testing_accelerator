class ReclucksController < ApplicationController
  def create
    current_user.reclucks.create!(cluck_id: params[:cluck_id])
    redirect_to user_clucks_path(current_user)
  end

  def destroy
    Recluck.find(params[:id]).destroy
    redirect_to user_clucks_path(current_user)
  end
end
