class CommentsController < ApplicationController

  before_action :find_image, only: [:show, :index, :new]

  def index
    @comment = Comment.all.order("created_at DESC")
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @image = Image.find(params[:image_id])
    @comment = Comment.create!(comment_params.merge(image: @image))

    if @comment.save
      redirect_to user_image_path(@user, @image), notice: "Comment created"
    else
      redirect "new"
    end
  end

  def update
    if @comment.update(comment_params)
      redirect @comment, notice: "Comment was updated"
    else
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:photo_url)
  end

  def find_image
    @image = Image.find(params[:image_id])
  end
end
