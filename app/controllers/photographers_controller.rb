class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:show, :edit, :update, :destroy]

  # GET /photographers
  def index
    @photographers = Photographer.all
  end

  # GET /photographers/1
  def show
  end

  # GET /photographers/new
  def new
    @photographer = Photographer.new
  end

  # GET /photographers/1/edit
  def edit
  end

  # POST /photographers
  def create
    @photographer = Photographer.new(photographer_params)

    if @photographer.save
      redirect_to @photographer, notice: 'Photographer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /photographers/1
  def update
    if @photographer.update(photographer_params)
      redirect_to @photographer, notice: 'Photographer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photographers/1
  def destroy
    @photographer.destroy
    redirect_to photographers_url, notice: 'Photographer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photographer
      @photographer = Photographer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photographer_params
      params.fetch(:photographer, {})
    end
end
