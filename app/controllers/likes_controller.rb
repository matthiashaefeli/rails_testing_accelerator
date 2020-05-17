class LikesController < ApplicationController
  def create
    cluck = Cluck.find(params[:cluck_id])
    current_user.likes.create!(cluck: cluck)
    redirect_to user_clucks_path(cluck.user)
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to user_clucks_path(current_user)
  end
end
