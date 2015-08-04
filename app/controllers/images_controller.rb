class ImagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_image, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:new, :show, :edit, :update, :destroy]

  def index
    @user = current_user
    @images = Image.all.order("created_at DESC")
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = current_user.images.new(image_params)

    if @image.save
      redirect_to user_image_path(@user, @image), notice: "Image created"
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

  def edit
  end

  def destroy
    @image.destroy
    redirect_to root_path
  end

  private

  def image_params
    params.require(:image).permit(:image_url, :key_words)
  end

  def find_image
    @image = Image.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
