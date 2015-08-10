class CommentsController < ApplicationController

  # before_action :authorized
  before_action :authenticate_user!
  before_action :find_image, only: [:show, :index, :new, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @image = Image.find(params[:image_id])
    @comment = Comment.create!(comment_params.merge(image: @image))

    if @comment.save
      redirect_to user_image_path(@user, @image), notice: "your comment image has been added!"
    else
      redirect "new"
    end
  end

  def update
    if @comment.update(comment_params)
      redirect @comment, notice: "your comment image has been updated!"
    else
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user, notice: "you liked this image!"
    redirect_to :back
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name Like ?', "%#{search}"])
      else find(:all)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:photo_url)
  end

  def find_image
    @image = Image.find(params[:image_id])
  end

  def find_user
    @user = User.find(params[:id])
  end

end
