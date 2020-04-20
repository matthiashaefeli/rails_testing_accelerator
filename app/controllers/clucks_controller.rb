class ClucksController < ApplicationController
  before_action :set_cluck, only: [:show, :edit, :update, :destroy]

  # GET /clucks
  def index
    @clucks = Cluck.all
  end

  # GET /clucks/1
  def show
  end

  # GET /clucks/new
  def new
    @cluck = Cluck.new
  end

  # GET /clucks/1/edit
  def edit
  end

  # POST /clucks
  def create
    @cluck = current_user.clucks.new(cluck_params)

    if @cluck.save
      redirect_to @cluck, notice: 'Cluck was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clucks/1
  def update
    if @cluck.update(cluck_params)
      redirect_to @cluck, notice: 'Cluck was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clucks/1
  def destroy
    @cluck.destroy
    redirect_to clucks_url, notice: 'Cluck was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluck
      @cluck = Cluck.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cluck_params
      params.require(:cluck).permit(:content, :user_id)
    end
end
