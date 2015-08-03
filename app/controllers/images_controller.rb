class ImagesController < ApplicationController

  before_action :find_image, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image, notice: "Image created"
      else redirect "new"
    end
  end

  def update
    if @image.update(image_params)
      redirect_to @image, notice: "Image was updated"
    else
      render "edit"
    end
  end

  private

  def image_params
    params.require(:image).permit(:image_url, :key_words)
  end

  def find_image
    @image = Image.find(params[:id])
  end

end
