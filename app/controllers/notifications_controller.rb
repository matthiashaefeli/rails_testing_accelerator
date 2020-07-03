class NotificationsController < ApplicationController
  def index
    @likes = Like.all
  end
end