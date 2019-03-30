class PhotosController < ApplicationController
  before_action :authenticate_photographer!, only: [:new, :create, :update, :destroy]
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  def index
    @photos = Photo.where(race_official: false)
  end

  # GET /photos/1
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)
    @photo.race = Race.find(photo_params[:race_id])
    @photo.photographer = Photographer.find(photo_params[:photographer_id])

    if @photo.save
      TextExtractionWorker.perform_async(@photo.image.url)
      redirect_to @photo, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    redirect_to photos_url, notice: 'Photo was successfully destroyed.'
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :race_id, :photographer_id, tags: [])
  end
end
