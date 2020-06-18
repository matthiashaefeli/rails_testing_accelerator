class LikesController < ApplicationController
  def create
    cluck = Cluck.find(params[:cluck])
    Like.create(cluck: cluck, user: current_user)
    redirect_to clucks_path
  end
end
