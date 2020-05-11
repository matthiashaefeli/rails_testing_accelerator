class ClucksController < ApplicationController
  before_action :set_cluck, only: [:show, :edit, :update, :destroy]

  def index
    @clucks = Cluck.all
  end

  def show
  end

  def new
    redirect_to new_user_session_path unless signed_in?
    @cluck = Cluck.new
  end

  def create
    @cluck = current_user.clucks.new(cluck_params)

    if @cluck.save
      redirect_to @cluck, notice: 'Cluck was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @cluck.destroy
    redirect_to clucks_url, notice: 'Cluck was successfully destroyed.'
  end

  private

  def set_cluck
    @cluck = Cluck.find(params[:id])
  end

  def cluck_params
    params.require(:cluck).permit(:content, :user_id)
  end
end
