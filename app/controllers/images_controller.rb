class ImagesController < ApplicationController
  def index
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
  end

  private

  def image_params
    params.require(:image).permit(:image_url, :key_words)
  end
end
