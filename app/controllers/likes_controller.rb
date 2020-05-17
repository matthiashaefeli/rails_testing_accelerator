class LikesController < ApplicationController
  def create
    cluck = Cluck.find(params[:cluck_id])
    current_user.likes.create!(cluck: cluck)
    redirect_to user_clucks_path(cluck.user)
  end

  def destroy
    like = Like.find(params[:id])
    cluck = like.cluck
    like.destroy

    redirect_to user_clucks_path(cluck.user)
  end
end
