class ImagesController < ApplicationController

  # before_action :authorized
  before_action :authenticate_user!
  before_action :find_image, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:new]

  def index
    @user = current_user
    @images = Image.all.order("created_at DESC")
  end

  def show
    @image = Image.find(params[:id])
    @comments = @image.comments.all
    @comment = @image.comments.build
  end

  def new
    @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = current_user.images.new(image_params)

    if @image.save
      redirect_to images_path(@user, @image), notice: "yes! you have successfully added an image!"
      else redirect "new"
    end
  end

  def update
    if @image.update(image_params)
      redirect_to @image, notice: "great! the image has been updated!"
    else
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @image.destroy
    redirect_to root_path
  end

  def search
  end

  private

  def image_params
    params.require(:image).permit(:image_url, :key_word)
  end

  def find_image
    @image = Image.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
